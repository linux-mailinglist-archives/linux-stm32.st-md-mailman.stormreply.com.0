Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB37D1E9D
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2019 04:43:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2BDEC36B0C;
	Thu, 10 Oct 2019 02:43:28 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88079C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 02:43:27 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id i76so2685294pgc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Oct 2019 19:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=QWteHAhBVt9oVGOsOtKHsCiYKtX8kIzt6852sk1FamE=;
 b=iei9S1oj45k0ZQgMqH7H0heioINFqEVoK5QQNnLJC6ig340LF/7lvfzuHdeKQlFK9x
 6Hkzh1+TJ0ShL8YMEXjqTIzqQykuK+7tNtk94vJ4PDCbixkpd/CwsT+tJo73VoTzALs/
 3YWHZQoNIZeLzmRb9W51aeEcULryqpcGxo8kCATCoMkcLHktP/FKv3Ju9PHc7WdcrGqO
 qhS24uqCCsyYuoV3mYvlcqYnea4e3PZbAMiwtrKuLXasFUvy0aiVsLwKeg0yUmpUQano
 OxYzAZwBbkwSmqpihYxzEX7I6XbxUNWZtxCAn7mGV3WyXxBTngz3tgAri5pGzUmpS68u
 GvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=QWteHAhBVt9oVGOsOtKHsCiYKtX8kIzt6852sk1FamE=;
 b=mVpUS9l566h61nuyWIZ2Wjqo/O5IslRwRLLwcuF0DVoJdDmepV4m9RiWEsgfBr9NiH
 SCRGiMuKwRV852GAXAvI91NNE0Rpjiu8UPpSu+5NaQAWAsfyjxuqC1SCyOab08UUyJaW
 D7sKY0yFMeaSIUuXr1TQwH+l4UQUViGpgGvith1kjEdLa1jHPleT4bCxdUIyDeGFaRa3
 1UdM91Uupjss3rrnWiKrG7oNzpXxpcBdUMA98TIJpKOc0gxGxG7F01PFYQmIYc9OHpu8
 nLcnQX7yh/iytXHfA7G/unQXsisaf55NkQy6DVr7cxQfEkv64+YrG6734MSKIP8Aidj7
 GULA==
X-Gm-Message-State: APjAAAVhpMFW7SoLxWTp7aD+CIeOloG4Bic1bRLe893gNHPT5neRUFmG
 XRgEFyRyuI97aZ3DjFNM+nSIMQ==
X-Google-Smtp-Source: APXvYqwanEd1qtiJMg/JVqFKEiqK+wQJaWOvm1tyP8JvAOqtrzd2OgCokg0CQcOtJoVJeVXoP6I4vw==
X-Received: by 2002:aa7:9e8d:: with SMTP id p13mr7146028pfq.171.1570675405027; 
 Wed, 09 Oct 2019 19:43:25 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id a16sm4961578pfa.53.2019.10.09.19.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 19:43:24 -0700 (PDT)
Date: Wed, 9 Oct 2019 19:43:11 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <20191009194311.55c8cf6e@cakuba.netronome.com>
In-Reply-To: <20191009073348.5503-1-biao.huang@mediatek.com>
References: <20191009073348.5503-1-biao.huang@mediatek.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: andrew@lunn.ch, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, yt.shen@mediatek.com,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND,
 PATCH] net: stmmac: dwmac-mediatek: fix wrong delay value issue
 when resume back
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

On Wed, 9 Oct 2019 15:33:48 +0800, Biao Huang wrote:
> mac_delay value will be divided by 550/170 in mt2712_delay_ps2stage(),
> which is invoked at the beginning of mt2712_set_delay(), and the value
> should be restored at the end of mt2712_set_delay().
> Or, mac_delay will be divided again when invoking mt2712_set_delay()
> when resume back.
> So, add mt2712_delay_stage2ps() to mt2712_set_delay() to recovery the
> original mac_delay value.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Applied, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
