Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 385319650FF
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 22:49:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA489C6DD6E;
	Thu, 29 Aug 2024 20:49:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CBEAC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 20:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724964549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VFLjaq4t+p4ySJaRjHHMD+djaojUeqjD8JR+7Pp4jkk=;
 b=h2mRxlhGpNNSCmA10MuMxL2Ffq/MSsiY6bRS8qxBbjKZEDUGpDCrMTYGLtJk2GInD5WDRs
 vNu+vJvgMl19bwvoKbRGAdzVnjtGErJkNjHekW+AecwfrBa4ZMJ7RjzDcps0gkSJGfNbje
 5uqvTu4nJ4qdvXQNkEe9bO/JBlTnXQk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-gEJKtoPENnCJ-6psmtkCGg-1; Thu, 29 Aug 2024 16:49:08 -0400
X-MC-Unique: gEJKtoPENnCJ-6psmtkCGg-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-44ff196bbfaso14218221cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 13:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724964547; x=1725569347;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VFLjaq4t+p4ySJaRjHHMD+djaojUeqjD8JR+7Pp4jkk=;
 b=f5o3FNTzUFGux8dIrPQCrGUwIS6/z89lSLH6zqEV9NejwzFvHdpzKEWjwR/XGiw9Pg
 sAW0GUVpzaFvawv1/UathKE3/Pqr9u7xlBxN/iJLNiDO3Dg4bXYRACKsbXWPsxKvq4LB
 +W1BcfdB8cWTu82CVzZT4l2nbgEtPfWA/1RgM3bD3kI4YrMJboeXtjd2egg1J0b2WbyH
 za+tmKWm0TnlMIr97Vebil+3TbrmF4GWduvmdOi6SP6sTyC+GGDhaBwXPWwh9rCw6gqv
 PNDYc+0sMNxVdi065F6oYIs+HCehqlEyA39E6ATqdKyePypPjTJZ35+E5kyQFWHt8Tb+
 16BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB4fi6mwUGnNDOWND9nZORyXQ9/mIETztkABr2cyz8Nqr4syXcpCkJAIa+ruOZQh5HBK/J3ntlSjXdQA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwlNT5UZSnCjlXGj91hunG6Hz4Lv41O7qSfmIejL+bGSI7TPqGj
 yruvg6fcwyJXUUcsQy59RD8SfXIGfue+Si0eKRMWPC4PjTMGgpyBFdBfJIv9KtWAbFmZlmZXQas
 K4eou6riXysT3Q1OPmZR2WxtwE6cDTW+J7jIhh1M3mokH2nfLyhLgZVVbUEFW3+XV25u+1l+WXU
 y2NQ==
X-Received: by 2002:a05:622a:578f:b0:453:5d83:6275 with SMTP id
 d75a77b69052e-4567f580d8fmr43858681cf.34.1724964547720; 
 Thu, 29 Aug 2024 13:49:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeb+yBjMEz9BPdapOW3IkPpcjpvG1lfzUxlrzusYIy/pZk9xn7Op0zmI0YQmjcAC+y5+roSg==
X-Received: by 2002:a05:622a:578f:b0:453:5d83:6275 with SMTP id
 d75a77b69052e-4567f580d8fmr43858371cf.34.1724964547321; 
 Thu, 29 Aug 2024 13:49:07 -0700 (PDT)
Received: from x1gen2nano.local ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45682ce3058sm8168951cf.52.2024.08.29.13.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 13:49:06 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 29 Aug 2024 15:48:44 -0500
MIME-Version: 1.0
Message-Id: <20240829-stmmac-no-ethtool-begin-v2-1-a11b497a7074@redhat.com>
X-B4-Tracking: v=1; b=H4sIAKze0GYC/3WNwQqDMBBEf0X23C3JNgj21P8oHmzcmIWalCSII
 v57g/Tawxwew7zZIXMSznBvdki8SJYYKtClAeuHMDHKWBlIkVGGDOYyz4PFEJGLLzG+8cWTBHQ
 31TpyusZAXX8SO1lP8xMCFwy8Fuhr4yWXmLbzctFn/7N3f+2LRo3K2JY6q6029Eg8+qFcbZyhP
 47jC+FGFz3JAAAA
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Abhishek Chauhan <quic_abchauha@quicinc.com>, 
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>, 
 Dmitry Dolenko <d.dolenko@metrotek.ru>
X-Mailer: b4 0.14.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: drop the ethtool
	begin() callback
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This callback doesn't seem to serve much purpose, and prevents things
like:

    - systemd.link files from disabling autonegotiation
    - carrier detection in NetworkManager
    - any ethtool setting

prior to userspace bringing the link up.

The only fear I can think of is accessing unclocked resources due to
pm_runtime, but ethtool ioctls handle that as of commit
f32a21376573 ("ethtool: runtime-resume netdev parent before ethtool ioctl ops")

Reviewed-by: Dmitry Dolenko <d.dolenko@metrotek.ru>
Tested-by: Dmitry Dolenko <d.dolenko@metrotek.ru>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
Changes in v2:
- Rebase on next-20240829
- Drop RFC/RFT tags, add Dmitry's Review/Test tag
- Link to v1: https://lore.kernel.org/r/20240429-stmmac-no-ethtool-begin-v1-1-04c629c1c142@redhat.com

I'd still like a few more folks to test this to feel more confident that
I'm not breaking anyone, but at least I've gotten one on list feedback
and one off list that its fine for them.
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 7008219fd88d..220c582904f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -438,13 +438,6 @@ static void stmmac_ethtool_setmsglevel(struct net_device *dev, u32 level)
 
 }
 
-static int stmmac_check_if_running(struct net_device *dev)
-{
-	if (!netif_running(dev))
-		return -EBUSY;
-	return 0;
-}
-
 static int stmmac_ethtool_get_regs_len(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -1273,7 +1266,6 @@ static int stmmac_set_tunable(struct net_device *dev,
 static const struct ethtool_ops stmmac_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
 				     ETHTOOL_COALESCE_MAX_FRAMES,
-	.begin = stmmac_check_if_running,
 	.get_drvinfo = stmmac_ethtool_getdrvinfo,
 	.get_msglevel = stmmac_ethtool_getmsglevel,
 	.set_msglevel = stmmac_ethtool_setmsglevel,

---
base-commit: b18bbfc14a38b5234e09c2adcf713e38063a7e6e
change-id: 20240424-stmmac-no-ethtool-begin-f306f2f1f2f4

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
