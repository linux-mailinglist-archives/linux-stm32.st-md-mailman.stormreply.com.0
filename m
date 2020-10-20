Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F15E294893
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Oct 2020 09:04:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A1A9C424B3;
	Wed, 21 Oct 2020 07:04:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3910FC424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603198752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=Qw1F19yZpnDVsqc+HFG0m1crxeHycCzf6HaecBeRc7s=;
 b=jLyhWrLy1cAseRZMHk7dYrcWzdHVCkaqw65dgVo50tgQK0L+dkf+DUa6VLCBtvBTmya8S8
 wrNu8qq2oU4CwQAhuuaV+m9H0xV1sjhRvbEVRZMqT1A0JqusViq1jwG0jU4rJNrfH1JecU
 o2MSQSfwv/40sEkKR13ReBW2m1en81k=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-sJzrhmpEM2WfU_nt3mHFmw-1; Tue, 20 Oct 2020 08:59:09 -0400
X-MC-Unique: sJzrhmpEM2WfU_nt3mHFmw-1
Received: by mail-qv1-f69.google.com with SMTP id s8so1230014qvv.18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 05:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Qw1F19yZpnDVsqc+HFG0m1crxeHycCzf6HaecBeRc7s=;
 b=beKf/0EQrNi4nhtAjaU6VH9WxqdQeTYcs2x0z6koRYQTGmllnk0Th+MiA3tpUlte7D
 OZe3vmDqDQOT5dr2/B1XUOAMZp4bURfgBKorXajCfTaEr1s5/2Xr+j5200t7fTqIitpq
 k6N6+4qVjBaq6ZVzYI9dT+WZL5kF71sxxzI45iqlZyYxkfUEvwL5YxCtNx/kXew8apak
 h2y8XgEY3Up3wOWxjD48NUFPrTPxSV387bWfp9xqxXXSPcE+TcF1w/Wj4CkqIQ1BzzFk
 3sZDgdvzpa7eatBHT3TraSHAUP3ucB7rGoUBJvIgnimS+9cC7DoXgjjDZkxlFesNp/fm
 TXNQ==
X-Gm-Message-State: AOAM530WIobTwHuLIuCGm67pOklK/hjmKlgC4PhHLddiKIsxikhZsd27
 292cgq/Vn1UHBTrZ249CgI958rr7sKatx8BIGP3t92H7r6wrksDetkneXyy70jzaB/B+9a6hJVm
 vIx8gv26YP8GWDeWv/ddMH5aTihzSyCiXC8bY/Wse
X-Received: by 2002:ac8:1ab4:: with SMTP id x49mr2308787qtj.39.1603198749166; 
 Tue, 20 Oct 2020 05:59:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSYG8X66Ps2XgHiXhXkimRB74ySBTCmyKFNySnJWuGJUoj6A5ZTEg0bhWDVOn/3M0lAtzsnA==
X-Received: by 2002:ac8:1ab4:: with SMTP id x49mr2308752qtj.39.1603198748879; 
 Tue, 20 Oct 2020 05:59:08 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id a128sm698132qkc.92.2020.10.20.05.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 05:59:07 -0700 (PDT)
From: trix@redhat.com
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 ath9k-devel@qca.qualcomm.com, johannes.berg@intel.com,
 emmanuel.grumbach@intel.com, luciano.coelho@intel.com, linuxwifi@intel.com,
 pkshih@realtek.com, lior2.cohen@intel.com, sara.sharon@intel.com,
 shahar.s.matityahu@intel.com, nathan.errera@intel.com,
 tova.mussai@intel.com, shaul.triebitz@intel.com, john@phrozen.org,
 Larry.Finger@lwfinger.net, christophe.jaillet@wanadoo.fr,
 zhengbin13@huawei.com, yanaijie@huawei.com, gustavoars@kernel.org,
 saurav.girepunje@gmail.com, joe@perches.com
Date: Tue, 20 Oct 2020 05:58:41 -0700
Message-Id: <20201020125841.26791-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:04:31 +0000
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Tom Rix <trix@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] wireless: remove unneeded break
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
---

v2: remove intersil/p54/eeprom.c

---
 drivers/net/wireless/ath/ath10k/htt_rx.c             | 1 -
 drivers/net/wireless/ath/ath6kl/testmode.c           | 1 -
 drivers/net/wireless/ath/ath9k/hw.c                  | 1 -
 drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c    | 2 --
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c  | 1 -
 drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c  | 1 -
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c | 3 ---
 7 files changed, 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 5c1af2021883..9c4e6cf2137a 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3878,7 +3878,6 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		return ath10k_htt_rx_proc_rx_frag_ind(htt,
 						      &resp->rx_frag_ind,
 						      skb);
-		break;
 	}
 	case HTT_T2H_MSG_TYPE_TEST:
 		break;
diff --git a/drivers/net/wireless/ath/ath6kl/testmode.c b/drivers/net/wireless/ath/ath6kl/testmode.c
index f3906dbe5495..89c7c4e25169 100644
--- a/drivers/net/wireless/ath/ath6kl/testmode.c
+++ b/drivers/net/wireless/ath/ath6kl/testmode.c
@@ -94,7 +94,6 @@ int ath6kl_tm_cmd(struct wiphy *wiphy, struct wireless_dev *wdev,
 
 		return 0;
 
-		break;
 	case ATH6KL_TM_CMD_RX_REPORT:
 	default:
 		return -EOPNOTSUPP;
diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
index 6609ce122e6e..b66eeb577272 100644
--- a/drivers/net/wireless/ath/ath9k/hw.c
+++ b/drivers/net/wireless/ath/ath9k/hw.c
@@ -2308,7 +2308,6 @@ void ath9k_hw_beaconinit(struct ath_hw *ah, u32 next_beacon, u32 beacon_period)
 		ath_dbg(ath9k_hw_common(ah), BEACON,
 			"%s: unsupported opmode: %d\n", __func__, ah->opmode);
 		return;
-		break;
 	}
 
 	REG_WRITE(ah, AR_BEACON_PERIOD, beacon_period);
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c b/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
index cbdebefb854a..8698ca4d30de 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
@@ -1202,13 +1202,11 @@ static int iwl_mvm_mac_ctx_send(struct iwl_mvm *mvm, struct ieee80211_vif *vif,
 		return iwl_mvm_mac_ctxt_cmd_sta(mvm, vif, action,
 						force_assoc_off,
 						bssid_override);
-		break;
 	case NL80211_IFTYPE_AP:
 		if (!vif->p2p)
 			return iwl_mvm_mac_ctxt_cmd_ap(mvm, vif, action);
 		else
 			return iwl_mvm_mac_ctxt_cmd_go(mvm, vif, action);
-		break;
 	case NL80211_IFTYPE_MONITOR:
 		return iwl_mvm_mac_ctxt_cmd_listener(mvm, vif, action);
 	case NL80211_IFTYPE_P2P_DEVICE:
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
index 63f9ea21962f..bd9160b166c5 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
@@ -1226,7 +1226,6 @@ static int _rtl88ee_set_media_status(struct ieee80211_hw *hw,
 	default:
 		pr_err("Network type %d not support!\n", type);
 		return 1;
-		break;
 	}
 
 	/* MSR_INFRA == Link in infrastructure network;
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c
index a36dc6e726d2..f8a1de6e9849 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c
@@ -1132,7 +1132,6 @@ static int _rtl8723e_set_media_status(struct ieee80211_hw *hw,
 	default:
 		pr_err("Network type %d not support!\n", type);
 		return 1;
-		break;
 	}
 
 	/* MSR_INFRA == Link in infrastructure network;
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
index f41a7643b9c4..225b8cd44f23 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
@@ -2085,12 +2085,10 @@ bool rtl8812ae_phy_config_rf_with_headerfile(struct ieee80211_hw *hw,
 		return __rtl8821ae_phy_config_with_headerfile(hw,
 				radioa_array_table_a, radioa_arraylen_a,
 				_rtl8821ae_config_rf_radio_a);
-		break;
 	case RF90_PATH_B:
 		return __rtl8821ae_phy_config_with_headerfile(hw,
 				radioa_array_table_b, radioa_arraylen_b,
 				_rtl8821ae_config_rf_radio_b);
-		break;
 	case RF90_PATH_C:
 	case RF90_PATH_D:
 		pr_err("switch case %#x not processed\n", rfpath);
@@ -2116,7 +2114,6 @@ bool rtl8821ae_phy_config_rf_with_headerfile(struct ieee80211_hw *hw,
 		return __rtl8821ae_phy_config_with_headerfile(hw,
 			radioa_array_table, radioa_arraylen,
 			_rtl8821ae_config_rf_radio_a);
-		break;
 
 	case RF90_PATH_B:
 	case RF90_PATH_C:
-- 
2.18.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
