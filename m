Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5659D9E63
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 21:24:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3C65C78F6E;
	Tue, 26 Nov 2024 20:24:39 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C6A7C78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 20:24:32 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53de771c5ebso2420553e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732652672; x=1733257472;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HCbQxBDGwoMQR+Ujqm6pGlRA4HnmMRyNgadk85WNZdc=;
 b=EQ74dIhr1wvYdu2Hc+xoEsU+VNLysctZS5EgMffcs8gxviq2tjLeHuUXMsrvxamk5S
 FbCeS5k7pYspXY4EsWU6EsgnocjXtm67NJ6FC5Po4Wpy0VvFxhpYoDwlf6U0o77nt/zT
 ZlTEXrrMlDKu0LFrR8aNmYAlIqgo4YxiWOpwdvGkVLN1v6I+oVwKUH2p4V5jR8RozbgK
 ZJGeYR+Dk+oDupszFXZp0JTcQ6ppRJLJByMQb+xzJuq8VQqaf1+j3drAxDdkAxHuHKOS
 v1x3C9iKkZsL8N32OYBBh1IYhOW0A3vtJOsppxe8ruYULCf0K8CNL0NHaAKcvix7WvBY
 4nKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732652672; x=1733257472;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCbQxBDGwoMQR+Ujqm6pGlRA4HnmMRyNgadk85WNZdc=;
 b=UsLxn1Ebu2jPZZHZrnWo67Io2U33We49a6HoQe+ogoyV0ubaAp54ACPCJcEI5HJeBb
 2Wsa6O8lIXbKCjdABH3dtwZJkYK0+5D0yIbYJOFb4l4ekCg8nG5mF3j7DQVacc0UFNQ9
 f9pZ4873U3PBhrWyvJd+l2a9/D63fz1LIrryu/1Ne7j76NZyrNgG/PpW4AwikRtctGKK
 jXdRxGc9PiJJ06J7Zto8r9akwA+tAfF1mObR/OrK030bACdxRSd+W/mfl/8ImlA98MIS
 UyFCOnd6VJUnBSbqwl6aK39pvmtEeHxVui0IkWqUqhVuSuTvsjsd1Csa6s8qRJO3HUF7
 acKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvwvw/MGnZO193O/dZ5eRx3gi1jY9f3Er3OqGQyNiMyTU3T/Z3pqFPGds3DMiOMGSj70v/1lD/w8vdPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyEHCLHoecQvgl2KSIophxOFJ/jJfZnwR2yYtIJQ86y2UQEezpB
 8kFY95DlgdN30q+1QMGe88lDRFlgG1YJ/K0WiY5apdFKSmuS6AUv
X-Gm-Gg: ASbGncvcMLBHFcNHArM8pDAtFvY1uojMkN0zHnU4WwmUDuUlZfgJgATxTZ1gxw72A2y
 CHI6CHtXqSj43xrE3EJCMNW8C/iKBc7stWcvVK0ZcYZgVY5enBrE3+PrlKFgnn+r/rdfnkrfMDF
 akfear505JLx/N8enm+CWEqREXR/ajr2wvYHVJ5WLBV2BCYY1ypyXAIGgTU5wmK/XBuyHouFxN/
 fsXwyGrYHsXYzrGz+BXNLQ7iznmZq7lMBrT509bDG/UTT4swSIwiP/uo22zE/2XgZbtqWE+U9vC
 UCXY/Wfb2WYI68g1nzhq9/WYpbkhAiZU1xeZmgel2spFSLajGjSL/EDWcAk5X5CVP/OTnQraOFS
 jaddYefwQFcTydBjt2J5I4VcEfRld0+tz4lBZtY/QlQ==
X-Google-Smtp-Source: AGHT+IEuYukIW1SzzFpdM0JiN5cbEMmlY2B1L0cx0Zr+6akBeltzj2q8qYuyGTdNxVhxgs1yNg6PuQ==
X-Received: by 2002:a05:6512:2395:b0:53d:dbc4:3b8f with SMTP id
 2adb3069b0e04-53df00d1110mr236390e87.13.1732652671453; 
 Tue, 26 Nov 2024 12:24:31 -0800 (PST)
Received: from ?IPV6:2a02:3100:b1b1:7000:f43f:954d:8ddd:f91b?
 (dynamic-2a02-3100-b1b1-7000-f43f-954d-8ddd-f91b.310.pool.telefonica.de.
 [2a02:3100:b1b1:7000:f43f:954d:8ddd:f91b])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-aa51759737dsm601261566b.81.2024.11.26.12.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 12:24:30 -0800 (PST)
Message-ID: <6df1ae83-32b8-4e0d-93b2-42eb2c47f1a7@gmail.com>
Date: Tue, 26 Nov 2024 21:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <E1tFv3U-005yhl-LJ@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <E1tFv3U-005yhl-LJ@rmk-PC.armlinux.org.uk>
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 05/23] net: phy: remove
 genphy_c45_eee_is_active()'s is_enabled arg
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

On 26.11.2024 13:52, Russell King (Oracle) wrote:
> All callers to genphy_c45_eee_is_active() now pass NULL as the
> is_enabled argument, which means we never use the value computed
> in this function. Remove the argument and clean up this function.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Eventually we should be able to get rid also of the adv argument
and use phydev->advertising_eee only. Prerequisite is rework of
eee_broken_modes. I have patches which I'm testing locally
currently. This can be a follow-up to your series.

Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
