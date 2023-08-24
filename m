Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4FF7877E8
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 20:33:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 153D6C6B47D;
	Thu, 24 Aug 2023 18:33:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31D18C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692901984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQSvh9slhSAVrK9RWa2tfsuNvxEUSp0MXiAFYeXPuAw=;
 b=XJfc4y6N2faFmurv6tTIlm1ifXhNdcbkV5RcYj9ST7tFrp7hrZakhqKF9te/G2q/psf3ds
 KOcTdHPhDXmfSuaSws3mxTP7cmsxArBiwjd2x4iKwZNPr7+Rg/zWnZTKP28hEMCKXogyaI
 EY+Or76eHK0L7xAWRvgUtnMFBSwZe8w=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-FYPfrzxeMUSljyrEW65eBw-1; Thu, 24 Aug 2023 14:33:03 -0400
X-MC-Unique: FYPfrzxeMUSljyrEW65eBw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-649832c0cf3so1656596d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 11:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901982; x=1693506782;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQSvh9slhSAVrK9RWa2tfsuNvxEUSp0MXiAFYeXPuAw=;
 b=Ogct7V2ehDEnrfJp86beCx9IZklJq0ST5EJyoEKsb0IMZflVNET5dw0qvr/tx15dsa
 w8j057d+7BENmdQRVUHP/c2LM/IMN8FzpVdtejC5ULFrzTgkuC4+pD7v3EQiAK4lvIue
 EkkA4dzhg2OEo0ODD1NN/AOLlIMNvOPxUF1uY+hyAIhEav/U9T30rkp8v4OingOF6XcU
 zmk1UGAI+DqCUoufgg5ok3gQYbt7tYaNAQjQPCYz2H4qXkKkmJKPU8pz1dhgB53eg+nu
 vBQ1lF+0EoD+iCPvUQCFdIyYL0mZHdI6gm+nMwiAN9uaEI4zf9Jjuj9m2LboP2hNRJQc
 ValA==
X-Gm-Message-State: AOJu0YyOZgr8okuJkAaCUPLnxnLPaoE1FA+2c/Zu20eE8dj8RM/UeNZu
 4RIMkqHivtU5DjwfMrM7L1xI5TgLpfld3PbBfSJLvd5XUTZgmdSwhYbYbYM57Nc6jDOrWvd331x
 7+nDY3owytahW0b8cJyAYlSMh9Duguew9p7aYI04w
X-Received: by 2002:a0c:a99b:0:b0:63a:5ebc:6e7a with SMTP id
 a27-20020a0ca99b000000b0063a5ebc6e7amr15574219qvb.31.1692901982710; 
 Thu, 24 Aug 2023 11:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj5ZJm6hpe0krNTRRf2s5iyapXzQ1FpiG0EpY/VpNEjLrDgHOUR63fuY3Iw6CLeMnPKpjAVQ==
X-Received: by 2002:a0c:a99b:0:b0:63a:5ebc:6e7a with SMTP id
 a27-20020a0ca99b000000b0063a5ebc6e7amr15574200qvb.31.1692901982497; 
 Thu, 24 Aug 2023 11:33:02 -0700 (PDT)
Received: from [192.168.1.165] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a0ceb11000000b0064f77d37798sm4209qvp.5.2023.08.24.11.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 11:33:02 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 24 Aug 2023 13:32:55 -0500
MIME-Version: 1.0
Message-Id: <20230824-stmmac-subsecond-inc-cleanup-v1-4-e0b9f7c18b37@redhat.com>
References: <20230824-stmmac-subsecond-inc-cleanup-v1-0-e0b9f7c18b37@redhat.com>
In-Reply-To: <20230824-stmmac-subsecond-inc-cleanup-v1-0-e0b9f7c18b37@redhat.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.12.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 4/7] net: stmmac: Remove a pointless
	cast
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

The type is already u64, there's no reason to cast it again.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f0e585e6ef76..20ef068b3e6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -859,7 +859,7 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 	 * where, freq_div_ratio = 1e9ns/sub_second_inc
 	 */
 	temp = div_u64(NSEC_PER_SEC, sub_second_inc);
-	temp = (u64)(temp << 32);
+	temp = temp << 32;
 	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
 	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
 

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
