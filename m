Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B5374DE9C
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 21:53:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA13BC6B457;
	Mon, 10 Jul 2023 19:53:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7891EC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 19:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689018781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gy/vSNQrD1I/JzE/a01WIAugyPEbnbITAis3wuB31bs=;
 b=HvX1sBf5kEJGxH1Sa/AQ+hp9u/uXZLYBvCqSoKu8jeYbXTwUGW1UQOSg5+2w8EN00pz40n
 YOF4BIRqvvf6Vpn3GIhfaCJx8WbevXf2nW2R70puL206UUtUZ68zeDHRZCzkeAaaGhNIJF
 icjHNqwDqY2pC81FYm1LkpgK0M89REE=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-1m_DffbNOxqZODz14wzIrg-1; Mon, 10 Jul 2023 15:53:00 -0400
X-MC-Unique: 1m_DffbNOxqZODz14wzIrg-1
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-395fd55e523so3679124b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 12:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689018779; x=1691610779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gy/vSNQrD1I/JzE/a01WIAugyPEbnbITAis3wuB31bs=;
 b=lBEeABmnvm567TwncEbLVo4OjS/Nw8fOcOYndeZSS8B0m/p/PspE1QQCGomDs8eHPw
 sevlJpzJt0MjeveW/2prQn48ABlIUtAh8Zo4GOdYPzCoQ5EvUoFCkAzgLu5rJJJj0KeH
 3bCzW78CsUPi3EtvgCDBN0FHxZL/d5bSdcuO7VuHIGpkjLHpY13QW1yNb6LHaDdZ4lxD
 bNmnkoevoWbHmyE7udqR7iubIhXTYyfPlLpdQ7CuCQdyFrB9uQOMe/J/Sw64yowU0HRg
 Dsezv62miqsIwbB+G9nmm4xn7zwgvUWCSSkiPJOg3hYB8/5cWGp0AbxuxGWwgswytfbJ
 hAgw==
X-Gm-Message-State: ABy/qLajXHZ6k2QL/s8YCSTP7LU0rrq7FZus6wdtZ0QpHKNUB9yxHRZY
 fIGcjBrl1T6HpZUrTuD0C7/cJ6zx+kj6O8IWI0X1dLdkIWCn5AIrR92cq7xDvrsCFeM3tTdGqtt
 8ESJESyf7itjAKdxSKYhTwmeGJnqovbZo3tvP9Kp2
X-Received: by 2002:a54:449a:0:b0:3a1:dd1e:a726 with SMTP id
 v26-20020a54449a000000b003a1dd1ea726mr9887203oiv.44.1689018779412; 
 Mon, 10 Jul 2023 12:52:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfk5sAu+Gz4ewFF0ZgHQ4JXru7kUigoww2rD7ehqaN1ZIbUUPXVTG7Kygn3sRVlp5C3Ukyjg==
X-Received: by 2002:a54:449a:0:b0:3a1:dd1e:a726 with SMTP id
 v26-20020a54449a000000b003a1dd1ea726mr9887189oiv.44.1689018779163; 
 Mon, 10 Jul 2023 12:52:59 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a544897000000b003a3d273aef8sm274972oic.6.2023.07.10.12.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 12:52:58 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 10 Jul 2023 14:50:57 -0500
Message-ID: <20230710195240.197047-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next] MAINTAINERS: Add another mailing
	list for QUALCOMM ETHQOS ETHERNET DRIVER
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

linux-arm-msm is the list most people subscribe to in order to receive
updates about Qualcomm related drivers. Make sure changes for the
Qualcomm ethernet driver make it there.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f115c355a41..e344af30e7e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17541,6 +17541,7 @@ QUALCOMM ETHQOS ETHERNET DRIVER
 M:	Vinod Koul <vkoul@kernel.org>
 R:	Bhupesh Sharma <bhupesh.sharma@linaro.org>
 L:	netdev@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
