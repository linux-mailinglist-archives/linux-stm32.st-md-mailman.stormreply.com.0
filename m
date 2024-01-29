Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4048840DC6
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 18:12:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 680AFC6B463;
	Mon, 29 Jan 2024 17:12:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E281C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 17:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706548351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xsce6k1bFLcIW+x8jc3gQMrtFj/bRo1gjpGuOMox5NI=;
 b=CeWhUdpAVEd3eHA/uJYbjZnkEXzNZDbxbsIqdrXMVmE1B2KAYrDIUE1JKusbkGRAEVSaCJ
 D7XdmHgMdU6Jv81Fos+aBkqFWe23vTS3ithqLNBryVSi7l1B9QLdN3e47R2Jr9t6yqQQG+
 D8ffZ9Ce5mS8KO26lxfM5j/ZgHRG7nw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-bBiAKrm-MDescqlVeSq7FQ-1; Mon, 29 Jan 2024 12:12:29 -0500
X-MC-Unique: bBiAKrm-MDescqlVeSq7FQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-78408c4e2c2so3664585a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 09:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706548349; x=1707153149;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xsce6k1bFLcIW+x8jc3gQMrtFj/bRo1gjpGuOMox5NI=;
 b=Q9xsNsq8WSeRsht2wwb0ZsA/PQZZvKWoeh13Lr2m8lk3H1MBjk8O9j0c80nPZYbrXL
 CIHcsV3XqqRIBwp29+FYGK4I/mKRb85MRw72Srocn2f097eJVt0lUEe97Xg8mOqtzF+v
 /+3pb7/WmyU9AOWgL1AzJsX/7+h5SqBhjI3Dhy4yf3E9I7oFJ15HKClUkEov3ESUuB4g
 LpmL5RjX6ndf2chCSAu5NxueGWmFPXghPboqB79FJ+Yqjlv0rKXO9YabMwATsv23RQd3
 UUMjwUkLK6jlSwQM22xVu5Lgmkp8uTYvSaqW2YaHVF3EH9VLikMP8ybJ4imROAr+uSil
 5v9g==
X-Gm-Message-State: AOJu0YztNCVsLVKapiejBfj+coMlfB+e1KVkXy+4E9s+itr+xs0sgFBo
 brrjib1as34ZPIRh934Sh6mT7s5ybALx/lFImQ2+hpnyLsIfBtR9UrM8E7Zxgy3vrQoa6m/+5h7
 NSTKUhTGl8U8L+MeBFETmVKEzZNrnLQm36W9kPq1BAg1spJHxrSt1YYBFqvrVcAcg4pN7ZQwoNH
 tbAQ==
X-Received: by 2002:a05:620a:909:b0:783:7775:b395 with SMTP id
 v9-20020a05620a090900b007837775b395mr5917729qkv.74.1706548349408; 
 Mon, 29 Jan 2024 09:12:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElNUymv0hHq1m2C6+cST6qAHiLIvOpOWStiSVR+Syryq46JeptpoFsfRaKAcF+vcwSHf43/Q==
X-Received: by 2002:a05:620a:909:b0:783:7775:b395 with SMTP id
 v9-20020a05620a090900b007837775b395mr5917709qkv.74.1706548349138; 
 Mon, 29 Jan 2024 09:12:29 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a05620a209600b00783e70cf38asm2195577qka.130.2024.01.29.09.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:12:28 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 29 Jan 2024 11:12:11 -0600
MIME-Version: 1.0
Message-Id: <20240129-remove-dwmac-qcom-ethqos-reviewer-v1-1-2645eab61451@redhat.com>
X-B4-Tracking: v=1; b=H4sIAGrct2UC/x2NwQqDMBAFf0X23AWTFNT+ivQQklfdQ0zdiBbEf
 2/a4xxm5qQCFRR6NCcpdimSlwrm1lCY/TKBJVYm29p7a+zAipR3cDySD7yGnBjbvObCPxsHlI1
 3XexDZ1zvqHbeipd8/o/xeV1ffEfE9nMAAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.12.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH] MAINTAINERS: Drop unreachable reviewer for
 Qualcomm ETHQOS ethernet driver
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

Bhupesh's email responds indicating they've changed employers and with
no new contact information. Let's drop the line from MAINTAINERS to
avoid getting the same response over and over.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
If anyone knows how to contact Bhupesh / if they're willing to continue
being a reviewer feel free to suggest an alternative, but for the moment
this is better than nothing.
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 939f6dd0ef6a..b285d9a123ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18080,7 +18080,6 @@ F:	drivers/net/ethernet/qualcomm/emac/
 
 QUALCOMM ETHQOS ETHERNET DRIVER
 M:	Vinod Koul <vkoul@kernel.org>
-R:	Bhupesh Sharma <bhupesh.sharma@linaro.org>
 L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

---
base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
change-id: 20240129-remove-dwmac-qcom-ethqos-reviewer-1a37d8c71383

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
