Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40052294891
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Oct 2020 09:04:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BF77C424C6;
	Wed, 21 Oct 2020 07:04:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D05DC3FAE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 15:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603119920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=u7a+QTs7KK/u/ERH7j5xA9SS8bPqHeGvDR9yK7S64mA=;
 b=c5W/8v1ae5F68uCL583yUzAW1bXFQZgMkAfWr+Ed1t9zluaoyL71oCrG/2sKEL1hBmHkev
 kNGM6s/jtNu2dNJnr8TPf2FZu6En2znmVn26xtKYKJ3bUBjSU6rbA9SYR6JW6tKEfYLfnn
 sZ43ipjEUFlzeXORN5b0ompjZ1lBSoY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-lLyvQSLXPK-x2ZaHAqR_3g-1; Mon, 19 Oct 2020 11:05:16 -0400
X-MC-Unique: lLyvQSLXPK-x2ZaHAqR_3g-1
Received: by mail-qk1-f200.google.com with SMTP id n125so7415064qke.19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 08:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=u7a+QTs7KK/u/ERH7j5xA9SS8bPqHeGvDR9yK7S64mA=;
 b=Hm2QPYAOHxEeEgJ/vsplfeDcBp+pDeTmLhRC3Zqhe+jCR0+zG5vo0sbIeqy3TSgDwM
 nbAqpsq+jao3vdZ3aThewSTzlktbNYoxJUeVtN32Lm7zfVgaTqGNAtEkfaq9Y9lnEQnx
 363bZSWWS57AzfSLEFQRtAEt21jMBk07RM46J2dtZS5TQnB+wh2EsE2UlNd/Z5b/WUs1
 8NwZbqJj8T3TbTYdYqu3YJUTLsVPRE+sq/2ObMd9V4q2NcXcb0sMqgPzhF4nip89msjl
 mLpGmPWO3C4ZhRj2mG7cyrzdnCiXj5wCIt+WPzeGb4QgXxMHgo4h0HKU6zn8en1n6Qtd
 MLDg==
X-Gm-Message-State: AOAM530JhirC4WIhGKzUwyVQPoxjJYaF7CzPGkXRHf312tjfzez2fPXc
 Ta+9FO3jVlEXgnPLkBF7c+e47gvcQSAyomldyqatY1hGM67gBUDt/hS8FyiLRQm9JqoC50nLBHN
 Ans9p9VWj+12zOjzNI45p5D4x6ZvB+zWVBO3LIdvC
X-Received: by 2002:a37:c441:: with SMTP id h1mr17142607qkm.298.1603119914412; 
 Mon, 19 Oct 2020 08:05:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9EpuyV+FOQcDIlLURPRb83MEHY+24QKbvxUas2gGKvh9VVGfUlDCjyG2/R4+31wwf3KJuwA==
X-Received: by 2002:a37:c441:: with SMTP id h1mr17142567qkm.298.1603119914140; 
 Mon, 19 Oct 2020 08:05:14 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id k64sm117193qkc.97.2020.10.19.08.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:05:13 -0700 (PDT)
From: trix@redhat.com
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 ath9k-devel@qca.qualcomm.com, johannes.berg@intel.com,
 emmanuel.grumbach@intel.com, luciano.coelho@intel.com, linuxwifi@intel.com,
 chunkeey@googlemail.com, pkshih@realtek.com, sara.sharon@intel.com,
 tova.mussai@intel.com, nathan.errera@intel.com, lior2.cohen@intel.com,
 john@phrozen.org, shaul.triebitz@intel.com, shahar.s.matityahu@intel.com,
 Larry.Finger@lwfinger.net, zhengbin13@huawei.com,
 christophe.jaillet@wanadoo.fr, yanaijie@huawei.com, joe@perches.com,
 saurav.girepunje@gmail.com
Date: Mon, 19 Oct 2020 08:05:07 -0700
Message-Id: <20201019150507.20574-1-trix@redhat.com>
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
Subject: [Linux-stm32] [PATCH] wireless: remove unneeded break
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

A break is not needed if it is preceded by a return or goto

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c             | 1 -
 drivers/net/wireless/ath/ath6kl/testmode.c           | 1 -
 drivers/net/wireless/ath/ath9k/hw.c                  | 1 -
 drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c    | 2 --
 drivers/net/wireless/intersil/p54/eeprom.c           | 1 -
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c  | 1 -
 drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c  | 1 -
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c | 3 ---
 8 files changed, 11 deletions(-)

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
diff --git a/drivers/net/wireless/intersil/p54/eeprom.c b/drivers/net/wireless/intersil/p54/eeprom.c
index 5bd35c147e19..3ca9d26df174 100644
--- a/drivers/net/wireless/intersil/p54/eeprom.c
+++ b/drivers/net/wireless/intersil/p54/eeprom.c
@@ -870,7 +870,6 @@ int p54_parse_eeprom(struct ieee80211_hw *dev, void *eeprom, int len)
 			} else {
 				goto good_eeprom;
 			}
-			break;
 		default:
 			break;
 		}
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
