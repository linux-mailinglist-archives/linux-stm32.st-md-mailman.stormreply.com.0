Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C09B374DF04
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 22:17:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68A6BC6B457;
	Mon, 10 Jul 2023 20:17:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61884C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 20:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689020250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MatPkdlfWwwrlUu3EVslUzYwQyXM940i5KEhzgEgAcU=;
 b=RD+hDi9cpwOmhPSzV/tdg0/baATuWNefhMompjAqVSuZ4QytETaisOeHxZt0owdZC7ys+u
 7px/Q50prhgEOFo6e2Gi5o3D+hMswORxkyC09mG20TG6WHDu6wKOfoHj1Hgu9GSzm2jKX4
 UtxYzTrE38izrpgcaKfY4tJu8FXOKsg=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-mLDqGQpVNkqkhD86fGzvwQ-1; Mon, 10 Jul 2023 16:17:29 -0400
X-MC-Unique: mLDqGQpVNkqkhD86fGzvwQ-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-57704af0e64so56990297b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 13:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689020249; x=1691612249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MatPkdlfWwwrlUu3EVslUzYwQyXM940i5KEhzgEgAcU=;
 b=F2X3sU+94gVccfdJ5fUN4Quq4DffqgQ23yeSqupC1iDMaRgVgP7aJ+Sc0HL0E7eK94
 eG6Bp1uj7xj1Fwjg2jvePCHBGFyW9YjoIvkttTCRJkf8lz7CTvVtUB4rczegDyk0KuAQ
 rq6hKrDk+AjlqHsKtBndhj5LfOTJkjlD8FK+zOz5+E/vHo/wT2TE2B3eF/c9b2IIm1ua
 5DlEKnYmE+EZ2bhpN2Jz7f/xJiA4kTpJmng58a9yIXk7/IlDIkA98IrNLFiBxIRwP7Ok
 +qL+frDDiEWSiLPodlypShwQzDpjmBLQ3LIZOb3sB7riW2Mau3/+2vH3FtXRBg4HFbFi
 lJ9w==
X-Gm-Message-State: ABy/qLZ5LGaoRD9dahZg7mO5Zc5vqDi8U4l7fVyU8affMo5iVcKvdS+I
 6FcRjuP9gp0POZuSKK0/cDpUhL4Ca34CeexPFUHJtmY4ENqxAqqC8iW9YcYiv1Qkur+0LvzRmIR
 B8lpknslUZC63aCDHpUsAGu9PeDv0YK0HFEXw+J7r
X-Received: by 2002:a81:4995:0:b0:569:e7cb:cd4e with SMTP id
 w143-20020a814995000000b00569e7cbcd4emr12772038ywa.48.1689020248800; 
 Mon, 10 Jul 2023 13:17:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHyRJxkGXCriSJqC1waS5qykotJRzMqF5zfNpiybzK4XMv35z9jl2wuOjlnU4LLJpYREhCLgA==
X-Received: by 2002:a81:4995:0:b0:569:e7cb:cd4e with SMTP id
 w143-20020a814995000000b00569e7cbcd4emr12772020ywa.48.1689020248527; 
 Mon, 10 Jul 2023 13:17:28 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a81920c000000b0056d2a19ad91sm155097ywg.103.2023.07.10.13.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 13:17:28 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 10 Jul 2023 15:06:36 -0500
Message-ID: <20230710201636.200412-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, simon.horman@corigine.com, kuba@kernel.org,
 pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac:
	dwmac-qcom-ethqos: Improve error handling
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

This series includes some very minor quality of life patches in the
error handling.

I recently ran into a few issues where these patches would have made my
life easier (messing with the devicetree, dependent driver of this
failing, and incorrect kernel configs resulting in this driver not
probing).

v1: https://lore.kernel.org/netdev/20230629191725.1434142-1-ahalaney@redhat.com/
Changes since v1:
    * Collect tags (Andrew Lunn)
    * Switch to of_get_phy_mode() (Andrew Lunn)
    * Follow netdev patch submission process (net-next subject, wait
      until merge window is open) (Simon)

Andrew Halaney (3):
  net: stmmac: dwmac-qcom-ethqos: Use of_get_phy_mode() over
    device_get_phy_mode()
  net: stmmac: dwmac-qcom-ethqos: Use dev_err_probe()
  net: stmmac: dwmac-qcom-ethqos: Log more errors in probe

 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 28 +++++++++++--------
 1 file changed, 17 insertions(+), 11 deletions(-)

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
