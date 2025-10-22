Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1631BFDCB8
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 20:16:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B598C5E2D6;
	Wed, 22 Oct 2025 18:16:02 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F3DFC5E2D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 18:16:00 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7a26ea3bf76so783188b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 11:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761156959; x=1761761759;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9QGp0U/4pbaeep/z7J48UOg7Dw8fa3jK3AlCVPGVI18=;
 b=Q22aC79IaUpZ26jfckaulyo0zlRAIk1l/mUMs5mI1i1pXYB21aJET31qxwccyIlRfA
 Njb7y/nvxdAYHPgqr8sF9P4BSLBY4HWK+Yqmma2PrLNaLu1LVitiVFwaFm9rjmWMlCiv
 Vfl5XEJykOOp+VzszzZQS7Pd3EqMfIwsN6UNYAKtZH8V7bv7/raFPp3vaXFJoS1QI+wr
 kzQa4trgnzRkEgLgu4GXiDumSvUr0uI4SB9vGsR2Qv4kIZ6+ipnfeJqecc0gw7J+8nXw
 BJhpFbIsR+vPLgIOwawnFtWUWXrkjgRJwNSkXY/JmVLTOajsUt8rEQRPh5AMrmMDBfrU
 Ephw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761156959; x=1761761759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9QGp0U/4pbaeep/z7J48UOg7Dw8fa3jK3AlCVPGVI18=;
 b=uBpKkdO5I+YzX6VcaJSQ72aKLuEkNUnvoEe32PPappTh2DpsqaofNXu3S650CuEVf0
 yW8fLeW5gFgQOLzpF6l6Q+hyvtPNzUb4n4oPIXcb7BZpSQ/CCg9u0A0vH8GwM+ILN08e
 jrVwfPQSLBX2sYMV4WOp/Lkn+JQyqFbKhJY55Mr+tNyt+qWZCXf2qpcpkef4oaWn67cQ
 mELz+2CYeTgOm7oi2wV9mdzDL3H/lQft3DwQtHFtLcTpT32Hyky0Q6sBW5Xxh6CMfMw9
 hzT38/Q7DZa7b9+qYMmk1l96tti4OwjF8X8WEt1Ymr2zCop+CGNUbEtwuONTSvn5nB2W
 QDCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4ND74mnktO4tcz49kpx3vbfh8d//UmMS5fdF3Fctv62KXr/kU6BV9GjEBJiCe1kKfhqkbs+dB6j70nQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4R+rDFduiZNAp7kJt/HuSfAfZlmRF+q1O3chAUwILRB+YD8L6
 VzI/v7pzS+49JrS3jLJH8x5u4C7zvWtbB3t1cilMJtjxwfecWOhFGTDX
X-Gm-Gg: ASbGnct0616Al5rdKM1b85+ZN5NuSt2qdVFxGvf1CVhq9FX19NTkrGydof94T2M8Cpp
 ntLuEJveTiTvX+1OReZ2YUBNPox2Tnw0xkpjey9W25+d9vh/roVVX7kTIGZ2CnzwlKDTgof/1SP
 xTWlE2rTwbdgx7e68wxjfaTfNocpQUQOzgG1IwGLfVLdg5xpKEj76sgomrFKtnQP4nbLDEyrlaZ
 DdWwiFNnoScuu+OC1gTknRYa9Aod2S6rZpGSod2uyskY4yxFRbOH7SuFAXNm6oKON2YySQnRXdf
 dU7kxmdNG3g3yYzdG+P4w1CT1FGN7VH8+bdI8QHj2BCdj0r1MBEaFO01ehJYEWYGG3u0yB1zVSh
 ksaBgIOxNITb0Jh+AwYfdIt/YqhHXJsPacg82sx+0D3NTPj0SDagOjcQO2T9Ru1GG2dqFe1+W+M
 C1/a4wPMWOuAlV7E86oN3a/SwsYZI=
X-Google-Smtp-Source: AGHT+IFMLQ6LX3tUc8TguSda9gIy2Uw3Gh8Ff81wUitAtyD2okPrCzKkucLqxqPjpTHJn/jjBsd/SQ==
X-Received: by 2002:a05:6a00:8d3:b0:781:24cb:13f4 with SMTP id
 d2e1a72fcca58-7a220a95434mr26308242b3a.1.1761156958833; 
 Wed, 22 Oct 2025 11:15:58 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a230121ebfsm15114561b3a.70.2025.10.22.11.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 11:15:57 -0700 (PDT)
Message-ID: <6a962d4b-f624-4eac-8a59-5472fb82b591@gmail.com>
Date: Wed, 22 Oct 2025 11:15:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: phylink: add phylink
 managed MAC Wake-on-Lan support
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

On 10/17/25 05:04, Russell King (Oracle) wrote:
> Add core phylink managed Wake-on-Lan support, which is enabled when the
> MAC driver fills in the new .mac_wol_set() method that this commit
> creates.
> 
> When this feature is disabled, phylink acts as it has in the past,
> merely passing the ethtool WoL calls to phylib whenever a PHY exists.
> No other new functionality provided by this commit is enabled.
> 
> When this feature is enabled, a more inteligent approach is used.
> Phylink will first pass WoL options to the PHY, read them back, and
> attempt to set any options that were not set at the PHY at the MAC.
> 
> Since we have PHY drivers that report they support WoL, and accept WoL
> configuration even though they aren't wired up to be capable of waking
> the system, we need a way to differentiate between PHYs that think
> they support WoL and those which actually do. As PHY drivers do not
> make use of the driver model's wake-up infrastructure, but could, we
> use this to determine whether PHY drivers can participate. This gives
> a path forward where, as MAC drivers are converted to this, it
> encourages PHY drivers to also be converted.
> 
> Phylink will also ignore the mac_wol argument to phylink_suspend() as
> it now knows the WoL state at the MAC.
> 
> MAC drivers are expected to record/configure the Wake-on-Lan state in
> their .mac_set_wol() method, and deal appropriately with it in their
> suspend/resume methods. The driver model provides assistance to set the
> IRQ wake support which may assist driver authors in achieving the
> necessary configuration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
