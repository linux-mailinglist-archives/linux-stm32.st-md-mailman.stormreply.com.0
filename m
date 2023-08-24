Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AC37877EC
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 20:33:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33DF7C6B456;
	Thu, 24 Aug 2023 18:33:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5835C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 18:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692901985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLlThC3R9OImoZ+MRsaHGOa2SVCnd5iJ51KhprNayB4=;
 b=WI7GAb87tP7mnRpBeTH91Znyjn1cl6S5pWbLfXl89I62rPWiJ1mi3ExG69AI3NceGiB2+B
 J+r/tGPsVW2Q3QaaR8Ud/ot4DDrI5hX42/1NXmIoPqsiOyTyGfF5DNCdFwayx+jvefuhME
 2HG/A67KcfqLKLhgQHXLJRAH4KLlS3U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-510WwWioM4eVfRe8Mvvt3g-1; Thu, 24 Aug 2023 14:33:04 -0400
X-MC-Unique: 510WwWioM4eVfRe8Mvvt3g-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-63cd1ea05d7so11844816d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 11:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901984; x=1693506784;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kLlThC3R9OImoZ+MRsaHGOa2SVCnd5iJ51KhprNayB4=;
 b=iGRtKe/0H+1VTSJhYqCfEegGs/nu4Sch7aFUShYtn2OfLsxCRUDsrh8r5OJD1op4j2
 tYZh8ftiel98O9RlglBFRD5wJBZLmL3P4cTXYJmdvXUJKrD4eFVT0MPob9w4VA9jsgiQ
 eMNTP/zk/NzWmDIBrQzxneutrgGQ+5QOpVkd2yw6ynYZhQpcy+UfE26aKvcPcABjcptI
 +BaPtR/z9/bzqC+dj72jK4BXWJU1N8RS/+YmPLwmg8NxPbJs+KmyttUSO9QQ/bXzWDEj
 HgK8nxO4DMyN1lUGd9LvymPVmRFWMc6nakswe2MTJfgtd6s0CGnssri0FNHhfA6ZmT8/
 jOeg==
X-Gm-Message-State: AOJu0Yx9zcp5o7Z18YhAMne51igHoWlqt+M3DT4KQVUGGqAJfWw/AlAm
 O0CgwH7QIksHifYkeYjySLOJgkuHU2XZyVPD7pv6nIC8TIukzzTukFR6rrtgGJtG1kVwPvuU7wZ
 MPTxXlGYbtvoggND0L2xEodzwQyu32HKpBOC9H5Mf
X-Received: by 2002:a05:6214:ac9:b0:64b:926a:e7fc with SMTP id
 g9-20020a0562140ac900b0064b926ae7fcmr19233937qvi.21.1692901984167; 
 Thu, 24 Aug 2023 11:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/pC6Ozwx0rjBhGbBoQuQPKXeDRWWo7/yf47bHb2XuaionNEwEaUXyApPQsLo9pKSgtTNXGg==
X-Received: by 2002:a05:6214:ac9:b0:64b:926a:e7fc with SMTP id
 g9-20020a0562140ac900b0064b926ae7fcmr19233915qvi.21.1692901983920; 
 Thu, 24 Aug 2023 11:33:03 -0700 (PDT)
Received: from [192.168.1.165] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a0ceb11000000b0064f77d37798sm4209qvp.5.2023.08.24.11.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 11:33:03 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 24 Aug 2023 13:32:56 -0500
MIME-Version: 1.0
Message-Id: <20230824-stmmac-subsecond-inc-cleanup-v1-5-e0b9f7c18b37@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next 5/7] net: stmmac: Correct addend typo
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

added should be addend in this context.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 20ef068b3e6b..dfead0df6163 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -853,7 +853,7 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 	/* Store sub second increment for later use */
 	priv->sub_second_inc = sub_second_inc;
 
-	/* calculate default added value:
+	/* calculate default addend value:
 	 * formula is :
 	 * addend = (2^32)/freq_div_ratio;
 	 * where, freq_div_ratio = 1e9ns/sub_second_inc

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
