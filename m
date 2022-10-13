Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 173305FE1F1
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 20:48:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96B6DC6410A;
	Thu, 13 Oct 2022 18:48:05 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04647C640FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 18:48:03 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id l28so2304916qtv.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 11:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hh8VSPpCMU9TIR5sHV9wcae/102Ucbb59hlSDBbz5K0=;
 b=jTpqb6zkVQ4xqk9gOWmU9z54LGeG7Qjn3ItnfydnvulihLlcuPeSEWmoivT+l9KQ8N
 KTF9k46oi+jJkFSYtiIrdRWdWwbYc5w5lj9HOI4LKFbB5mL+KTzeOvA5Oj1qsD8GEIv8
 rqZzSALPiyy7BMHRY5aS5crLMMfcAUaRRtXNJo3CcbybGra1OAZq6vGD9vMsRLvjTHcv
 6EUVhMDNaXQzNraQa5xJxDWZjtcBxHER7EA9OzQBqK2s43+Lo5dO0cO5h22QLCFJ0dWi
 5y9AKHe3VsWY1MXbhWpfq8FpZ6/8Lg9Mc1x623wLRAmEa9adgvDvnkxfDwcMBTw7Jsxt
 Jzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hh8VSPpCMU9TIR5sHV9wcae/102Ucbb59hlSDBbz5K0=;
 b=0dagJNrZQ2a6isNM8vTPgNfrX4R4oyJ8WFy7GSbfU/58i61Y+xtTvfaM4UGDwjRqMk
 ae+EPG4GPR0FCM+PcD/rZ7VBE5Sha6gnYLIK/PGl31JBLHzHKNcmK2UXZjVznHM4pLx0
 IDTfn3UROs/1TmR1/AvlkUKx/5yLHX/+8PDqp6bW4lBF+KM9LcrgehdGlISAU23ONcYJ
 cODhA5DAyWBVFtg4UD6rqOL525KmW3irc3Gh7fy8qvoTsEh/mdfPgRan34zAMQaitkkg
 rGVznU+CJjCOLk2S8KofJP9cVDO9fk8Ck8SZT/cwDyxtwBOP/uu6gp43RkS8yWEc2wUh
 OrVw==
X-Gm-Message-State: ACrzQf27deqPSwYT0KmGrEilLeBxQvo5Os97BeV3v3wrScI0gEmsrjkp
 t4Wp3GUyzcmrXZR2kUWz9FE=
X-Google-Smtp-Source: AMsMyM7FqhQ83abcQwq5mIJuWc2u/CV0q4+UWl5+zr+whM9PEeb41Ff7MvU48hn8K17v6H0ubYn0Bg==
X-Received: by 2002:ac8:4d5b:0:b0:39c:b6d2:b631 with SMTP id
 x27-20020ac84d5b000000b0039cb6d2b631mr1078235qtv.487.1665686882814; 
 Thu, 13 Oct 2022 11:48:02 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 l3-20020ac84583000000b003986fc4d9fdsm497159qtn.49.2022.10.13.11.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:48:02 -0700 (PDT)
Message-ID: <2c861748-b881-f464-abd1-1a1588e2a330@gmail.com>
Date: Thu, 13 Oct 2022 11:47:55 -0700
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
 <20221013133904.978802-2-shenwei.wang@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221013133904.978802-2-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Russell King <rmk+kernel@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 1/2] net: phylink: add mac_managed_pm
 in phylink_config structure
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
> The recent commit
> 
> 'commit 47ac7b2f6a1f ("net: phy: Warn about incorrect
> mdio_bus_phy_resume() state")'
> 
> requires the MAC driver explicitly tell the phy driver who is
> managing the PM, otherwise you will see warning during resume
> stage.
> 
> Add a boolean property in the phylink_config structure so that
> the MAC driver can use it to tell the PHY driver if it wants to
> manage the PM.
> 
> 'Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect
> mdio_bus_phy_resume() state")'

This is not the way to provide a Fixse tag, it should simply be:

Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect 
mdio_bus_phy_resume() state"

With that fixed:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

as a courtesy, you could CC the author of the patch you are fixing BTW
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
