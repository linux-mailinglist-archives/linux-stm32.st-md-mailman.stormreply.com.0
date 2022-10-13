Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F615FE1F6
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 20:49:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B48CCC6410A;
	Thu, 13 Oct 2022 18:49:01 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 677D5C640FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 18:49:00 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id mx8so1852866qvb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SpiOZdhs8DkPfxMIeo17LG9S/lTyDpfq6Tzt1fvQgiE=;
 b=Ki7BXDIsOAs2d8IRlb3OHYg07FqRdwfGAcX/YuQvENX4X4gLe+PdKqDnvrX8qe1oUL
 M2xh4acuHPHDAftUjU6YXbqqUUGi7s7vFz1aIkGsSWCaoqMXd8WxV18Pzwbb3ak3pKCW
 w/U6crLc3UyXQc3IWWWli2a6iPDm5ZcGc264J3g0cerGefkoK2wEvZmxYeFCdYYgns5Q
 p3xQTp2TlfRcTI4mMmJkiR435K5bie6vIWPpFqO/I7XRcph5Yjr2BLzERptdf6JQHp6l
 3+kAjzTqYBHdT3krbiK3KPbiBooMCFHi7F84xKhazwf1Gxo/3mR6NxlBXe5TjBc0QJw2
 OqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SpiOZdhs8DkPfxMIeo17LG9S/lTyDpfq6Tzt1fvQgiE=;
 b=8P5W7QV7IJ29pvNjtzSCoEQDGKPZW3cPir6x4XPVwn47LbP46Cb49+hR6IuZ4kSDI+
 /RcX+TEWuGU+HZiiWF+ZZZ7gkak0jLfVC3Gu97yvbE3SH4ETq2nR0Vbb5ozEsCxGxdW+
 5WPmmJMC2p9ZBCTcDoIkRYwzZUMENrrCItc2wvUsfhWwbcGyIwvzk3YX2UIiJXauwGrr
 sueJZLk1zSTjiLcJ0rq73y0v7W45/UxwIZ9nr6vZuoX+1cYtGpqnaBrcwnT6tFesvNSk
 NoZVGTADUoY3c05fYXBYEmulwRfg8tuSVteexg44rX9GLb0gwWgGFJwnGKG6WJoW2FVc
 71nA==
X-Gm-Message-State: ACrzQf0f4upSgWqbzkZ7JPp74bZTdXA0fIszoA+ic/G/w1Wlb1+mGkT+
 iaDqDi9EOT738Q8tnpmInVg=
X-Google-Smtp-Source: AMsMyM5FCRoHrM/azxvKD7WtMMpuO+Jx4fYXgDuPE0V3s7qhBDL2AcmK82A2VStcm2YBSSRyi0T1jQ==
X-Received: by 2002:a05:6214:518b:b0:4b1:dae2:4537 with SMTP id
 kl11-20020a056214518b00b004b1dae24537mr1009917qvb.2.1665686939334; 
 Thu, 13 Oct 2022 11:48:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 g10-20020ac8070a000000b0039cc47752casm432705qth.77.2022.10.13.11.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:48:58 -0700 (PDT)
Message-ID: <aa6b1fcd-b8d8-2df4-b4a8-b77f7a7e5fb2@gmail.com>
Date: Thu, 13 Oct 2022 11:48:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
References: <20221013133904.978802-1-shenwei.wang@nxp.com>
 <20221013133904.978802-3-shenwei.wang@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221013133904.978802-3-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 2/2] net: stmmac: Enable mac_managed_pm
	phylink config
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/13/22 06:39, Shenwei Wang wrote:
> Enable the mac_managed_pm configuration in the phylink_config
> structure to avoid the kernel warning during system resume.
> 
> 'Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect
> mdio_bus_phy_resume() state")'
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Same comment as patch #1, the Fixes tag is improperly formatted and does 
not require the use of ' before and after.

With that fixed:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
