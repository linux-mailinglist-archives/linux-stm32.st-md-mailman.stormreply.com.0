Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5FE0D0A
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2019 22:08:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 191FDC36B0B;
	Tue, 22 Oct 2019 20:08:04 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81867C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 20:08:02 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m7so18568543lji.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 13:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=Jepvi8++4KHG9zardrX3M8QtVwArs/duyX7iXwqTssk=;
 b=hTrtaAgEvhNL0YSN4U/x7Ca1+Q6F/DEsj55rl49kx51S9+p2NR+6PM81lRfoDLK9lf
 837MSmEeURh7Y/sXwPp0y3bYNslB1HEp3ToeLTT/chG/obKoJSZ2HtUZ/95uMt8rfPlO
 g5nHV5XCj1IWeIaftr1vFN4QXb3uFltJs783fwOHs0A0QJVcWT41VJeZoThHcK7t2iJT
 f9dWzOIX6OwZbaeBacSubKeCVZyS7/HHK0k9xK87b027TFPMjLffxioec+lQTYQE/8PV
 qWcFyjAUZk4OiY1Dq2jGS60GfL0ll2hI/SOnQ+u9g7uJDfvuPFk7hvNwJDAWTBjFvi5/
 XHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Jepvi8++4KHG9zardrX3M8QtVwArs/duyX7iXwqTssk=;
 b=RZuVB0c/RfKThk5uT8u+PcmKXuIu70htby3j7RJER3E7F1jECJyd2cH/VXy5P4uqr+
 lJsXoxdfATd7dSEGkdTAZU7CECkTOxQIDWvQL71fjijKUT2UBZQgywBEvUqx58sXv5D4
 BF4s6ICwAqQHaTSrH0P2D9YZ8DdhY+Jq1vzUCvoaf6+UbQNgKTiZCDVV621NXlzokBnC
 fw9OiWyvJK3QTTSZIgU6aAb703IkzKxN5DDTwWGLTieIvKZZnvL/gHwZ2DYA4qz8Gxwp
 HFtUC5SopFNSJ/LIzrkPe/nvTXcCueSFYL3q12/NkqRKBiKXcL6MxwDj87lleARpgmT4
 yTsg==
X-Gm-Message-State: APjAAAXa3aPhSxFs3oCbs7WVHqxxKaBoLYnONRs8MeaTaQFU103/AU5c
 FoGHqGsoM6PnYtQZsttqnxokmA==
X-Google-Smtp-Source: APXvYqzHW17dZfehUbHroL+khGtd2o684rg84WG/ysl2SL0ML5ulZOe6aNdkECAkJAUfz3BKic2dBA==
X-Received: by 2002:a2e:9a99:: with SMTP id p25mr19086167lji.171.1571774881729; 
 Tue, 22 Oct 2019 13:08:01 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id q16sm7027794lfo.7.2019.10.22.13.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 13:08:01 -0700 (PDT)
Date: Tue, 22 Oct 2019 13:07:53 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <20191022130753.70c12b55@cakuba.netronome.com>
In-Reply-To: <1571628454-29550-1-git-send-email-zhangshaokun@hisilicon.com>
References: <0b6b3394-f9f0-2804-0665-fe914ad2cdea@gmail.com>
 <1571628454-29550-1-git-send-email-zhangshaokun@hisilicon.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S.
 Miller" <davem@davemloft.net>, yuqi jin <jinyuqi@huawei.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Fix the problem of
	tso_xmit
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

On Mon, 21 Oct 2019 11:27:34 +0800, Shaokun Zhang wrote:
> From: yuqi jin <jinyuqi@huawei.com>
> 
> When the address width of DMA is greater than 32, the packet header occupies
> a BD descriptor. The starting address of the data should be added to the
> header length.
> 
> Fixes: a993db88d17d ("net: stmmac: Enable support for > 32 Bits addressing in XGMAC")
> Cc: Eric Dumazet <eric.dumazet@gmail.com>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Signed-off-by: yuqi jin <jinyuqi@huawei.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
> Changes in v2: 
>     -- Address Eric's comment: add the Fixes tag

Applied and queued for 5.3, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
