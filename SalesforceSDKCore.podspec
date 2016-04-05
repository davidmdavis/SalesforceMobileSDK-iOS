Pod::Spec.new do |s|

  s.name         = "SalesforceSDKCore"
  s.version      = "4.2.0"
  s.summary      = "Salesforce Mobile SDK for iOS"
  s.homepage     = "https://github.com/forcedotcom/SalesforceMobileSDK-iOS"

  s.license      = { :type => "Salesforce.com Mobile SDK License", :file => "LICENSE.md" }
  s.author       = { "Kevin Hawkins" => "khawkins@salesforce.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/forcedotcom/SalesforceMobileSDK-iOS.git",
                     :tag => "pod_v#{s.version}",
                     :submodules => true }
  
  s.requires_arc = true
  s.default_subspec  = 'SalesforceSDKCore'

  s.subspec 'SalesforceSDKCore' do |sdkcore|

      sdkcore.dependency 'CocoaLumberjack', '~> 2.2.0'
      sdkcore.libraries = 'z'
      sdkcore.resource_bundles = { 'SalesforceSDKResources' => [ 'shared/resources/SalesforceSDKResources.bundle/**' ] }
      sdkcore.resource = 'shared/resources/SalesforceSDKAssets.xcassets'

      sdkcore.subspec 'base' do |sp|
          sp.source_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/Logging/SFLogger.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/Logging/SFLogger.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFAdditions.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSString+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSString+SFAdditions.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSNotificationCenter+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSNotificationCenter+SFAdditions.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFPathUtil.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFPathUtil.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFFileProtectionHelper.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFFileProtectionHelper.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/Logging/SFCocoaLumberJackCustomFormatter.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/Logging/SFCocoaLumberJackCustomFormatter.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SalesforceSDKConstants.h'
          sp.public_header_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/Logging/SFLogger.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSString+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSNotificationCenter+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFPathUtil.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFFileProtectionHelper.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/Logging/SFCocoaLumberJackCustomFormatter.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SalesforceSDKConstants.h'
          sp.requires_arc = true
          sp.prefix_header_contents = '#import "SFLogger.h"', '#import "SalesforceSDKConstants.h"'
      end

      sdkcore.subspec 'no-arc' do |sp|
          sp.dependency 'SalesforceSDKCore/SalesforceSDKCore/base'
          sp.source_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper+Internal.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper.m'
          sp.public_header_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper.h'
          sp.requires_arc = false
          sp.prefix_header_contents = '#import "SFLogger.h"', '#import "SalesforceSDKConstants.h"'
      end

      sdkcore.subspec 'arc' do |sp|
          sp.dependency 'SalesforceSDKCore/SalesforceSDKCore/base'
          sp.dependency 'SalesforceSDKCore/SalesforceSDKCore/no-arc'
          sp.source_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/**/*.{h,m}', 'libs/SalesforceSDKCore/SalesforceSDKCore/SalesforceSDKCore.h'
          sp.exclude_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/Logging/SFLogger.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/Logging/SFLogger.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFAdditions.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSString+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSString+SFAdditions.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSNotificationCenter+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSNotificationCenter+SFAdditions.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFPathUtil.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFPathUtil.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFFileProtectionHelper.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFFileProtectionHelper.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/Logging/SFCocoaLumberJackCustomFormatter.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/Logging/SFCocoaLumberJackCustomFormatter.m', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SalesforceSDKConstants.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper+Internal.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFKeychainItemWrapper.m'
          sp.public_header_files = 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSArray+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSData+SFSDKUtils.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSDictionary+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/NSURL+SFAdditions.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/NSURL+SFStringUtils.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFAbstractPasscodeViewController.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFApplication.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFAuthErrorHandler.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFAuthErrorHandlerList.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFAuthenticationManager.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFAuthenticationViewHandler.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Login/SFLoginViewController.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFCommunityData.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFCrypto.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFDefaultUserManagementDetailViewController.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFDefaultUserManagementListViewController.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFDefaultUserManagementViewController.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFDirectoryManager.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFEncryptionKey.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFGeneratedKeyStore.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Identity/SFIdentityCoordinator.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Identity/SFIdentityData.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFInactivityTimerCenter.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Instrumentation/SFInstrumentation.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFJsonUtils.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFKeyStore.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFKeyStoreKey.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFKeyStoreManager.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFManagedPreferences.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Instrumentation/SFMethodInterceptor.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthCoordinator.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthCredentials.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthCrypto.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthInfo.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthKeychainCredentials.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthOrgAuthConfiguration.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/OAuth/SFOAuthSessionRefresher.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFPBKDF2PasscodeProvider.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFPBKDFData.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFPasscodeKeyStore.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFPasscodeManager+Internal.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFPasscodeManager.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFPasscodeProviderManager.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFPasscodeViewController.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFPasscodeViewControllerTypes.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFPreferences.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/PushNotification/SFPushNotificationManager.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFRootViewManager.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFSDKAppConfig.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Protocols/SFSDKAppDelegate.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Test/SFSDKAsyncProcessListener.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFSDKCryptoUtils.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFSDKDatasharingHelper.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFSDKReachability.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKResourceUtils.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Test/SFSDKTestCredentialsData.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Test/SFSDKTestRequestListener.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFSDKWebUtils.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFSHA256PasscodeProvider.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFSecurityLockout+Internal.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFSecurityLockout.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFTestContext.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFUserAccount.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFUserAccountConstants.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFUserAccountIdentity.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFUserAccountManager.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Security/SFUserAccountManagerUpgrade.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SFUserActivityMonitor.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/SalesforceSDKCore.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SalesforceSDKCoreDefines.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/SalesforceSDKManager.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Test/TestSetupUtils.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/UIDevice+SFHardware.h', 'libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Common/UIScreen+SFAdditions.h','libs/SalesforceSDKCore/SalesforceSDKCore/Classes/Util/SFApplicationHelper.h'
          sp.requires_arc = true
          sp.prefix_header_contents = '#import "SFLogger.h"', '#import "SalesforceSDKConstants.h"'
      end

  end

end
