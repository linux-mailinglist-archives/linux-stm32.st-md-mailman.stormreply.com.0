Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 568BC82F8F5
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 21:56:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03580C6B476;
	Tue, 16 Jan 2024 20:56:51 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A391C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 20:56:49 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7831ed13d39so824161985a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 12:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705438608; x=1706043408;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L6sTQ65U6A8ITpkEUOdf6EqefqmO1TtLddPAd4Z4We4=;
 b=EF/Jhga60hvviBw9Zma5BfDt8/LI+MJJrShcBKywjxLFkpbngt091BG1bVdQ8cNqtf
 cv/fnnZQ6DIbeg43amXsPBkvFMpexGoAvFn5mnyW/3mhcwzze1v/Q4/DjyPvxRYRA5JW
 hVEAlElowp6xIm56M4dYeh/aXP/rRgdFksnKyyYosQm0g6qA1mH2cO2igcEY4ch6Uccj
 L2Y1fK0e3kTo3O978uCKCBvueHspg8sQK28CojFgO4oHV7pmic/h/iWhKhF/4A55n2cQ
 RuQcdmc2z51Rl+ayyMz9c0nDY7qphpltYHH6DpJtE260ihjOxJEjakYDjTvlsif5t4bx
 6hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705438608; x=1706043408;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L6sTQ65U6A8ITpkEUOdf6EqefqmO1TtLddPAd4Z4We4=;
 b=Q+w+jngoSEXOlgVwIuXC0K3n0ZWeJ2QCWJtONYeC1WCsWnhhMySdjrPaCj3TVqHDGe
 86xxLnHU1QvvFILKNTiepRSADgaCcRiGaeoieQLeKoquIl/ENI1k22F1bZC0ai4esHEU
 ZvdnSno7djpdSfburDAYXueFsRbCpBKBWIIvaSl4kQHElrOGywmatsGPzYOI9HcSKwJk
 lAXKTR8bnQ0VogeoZ2XNjhLz7VtOZXVImb+0Cfqs+AjPS6wdWo525m5BgYdQSIQ3d9CQ
 G3VNJfZrGZa3e3ya/xC56XLHKzJJa79ipjdQ1cOa1wgHl7WsnONJq09/ZDo25++4poAa
 10xQ==
X-Gm-Message-State: AOJu0YweiF0lJO/6AI4Dlw6aXrkraExvFhovfTN/gG1Xn2Qj8siVMnhO
 rAEvG0FWRd6wfn+3A15jJkI=
X-Google-Smtp-Source: AGHT+IHz0uzBk0u4ED2kfYEZ9yMEhdws58vq7kMoR1kk+FYU+sLQs6/0tij/7mi3eeld1/aht75/Cw==
X-Received: by 2002:a05:620a:29d1:b0:783:5a17:a8f6 with SMTP id
 s17-20020a05620a29d100b007835a17a8f6mr5689097qkp.130.1705438608045; 
 Tue, 16 Jan 2024 12:56:48 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 o11-20020a05620a22cb00b00781823ddd45sm4006376qki.18.2024.01.16.12.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 12:56:47 -0800 (PST)
Message-ID: <fe6452a6-2e34-4c22-b3d4-af3a4d592fdf@gmail.com>
Date: Tue, 16 Jan 2024 12:56:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Romain Gantois <romain.gantois@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
References: <20240116-prevent_dsa_tags-v6-1-ec44ed59744b@bootlin.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240116-prevent_dsa_tags-v6-1-ec44ed59744b@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>, stable@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Vladimir Oltean <olteanv@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v6] net: stmmac: Prevent DSA tags from
	breaking COE
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

On 1/16/24 04:19, Romain Gantois wrote:
> Some DSA tagging protocols change the EtherType field in the MAC header
> e.g.  DSA_TAG_PROTO_(DSA/EDSA/BRCM/MTK/RTL4C_A/SJA1105). On TX these tagged
> frames are ignored by the checksum offload engine and IP header checker of
> some stmmac cores.
> 
> On RX, the stmmac driver wrongly assumes that checksums have been computed
> for these tagged packets, and sets CHECKSUM_UNNECESSARY.
> 
> Add an additional check in the stmmac TX and RX hotpaths so that COE is
> deactivated for packets with ethertypes that will not trigger the COE and
> IP header checks.
> 
> Fixes: 6b2c6e4a938f ("net: stmmac: propagate feature flags to vlan")
> Cc:  <stable@vger.kernel.org>
> Reported-by: Richard Tresidder <rtresidd@electromag.com.au>
> Link: https://lore.kernel.org/netdev/e5c6c75f-2dfa-4e50-a1fb-6bf4cdb617c2@electromag.com.au/
> Reported-by: Romain Gantois <romain.gantois@bootlin.com>
> Link: https://lore.kernel.org/netdev/c57283ed-6b9b-b0e6-ee12-5655c1c54495@bootlin.com/
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
