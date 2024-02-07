Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA784CC19
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 14:55:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0A8EC6C85A;
	Wed,  7 Feb 2024 13:55:25 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8351EC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 13:55:24 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-50eac018059so998736e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Feb 2024 05:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707314124; x=1707918924;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=by92DEK9XSM7323pyJ6TZwfJcKH/EW0cCEEjPXbhw7o=;
 b=NwPBmX4oysuz5HXUfsoIMFoLxxR6Wk4NOdzHkFXSAQy9xvdBe0GxFwnUDTPp85/aNh
 IyEBxUS4jULOZKJ4D8UlKqAKSzC2R3fSOI6nk5NzUjn2QsCJhRKJWI2PaJ/qxhijdZ1d
 VfocDSPRoPJhO5w6aaPj2Wqq394hcOjXeR1sMzGJEXbA9zh9q2wUIPZ+YKaviZ1NWw0J
 VZeqcskcNhifdf2XCer8dsfSXn2vDXq2BanvK0sS+cvzFEo9mByd5FaFFQr/biEnQWIG
 kydzX/Y5qfRDNt4Ui3OHAYiaOWzHcW5YHY7Myt5GVB2IAmXRarkRgVpLR67ZLXf1Qzxe
 HlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707314124; x=1707918924;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=by92DEK9XSM7323pyJ6TZwfJcKH/EW0cCEEjPXbhw7o=;
 b=Rmkbs6k+MmpY1nAmtpA5LPkDssDsEEZyrz41IGOTlHG8uD3PU2scFL6Uaw3bPr4UZx
 XrY/iO8PoBpKAKKaUl6FiIEXldaOObfLd6nvU3qjh+2dRVXI6jZvo2IZzyIqxCvucoJh
 1Q3Woez5d/lDBG/eEaNa2dzWcNC99+WfBsy+KuZUz0GuTNCpLa8rG8FDgB9S1FKbC0qq
 yw3rY22LC/p7S1kZMNDeJ/Bah9QNdc0dmm08pPfTt2wBDhGNEcG5gKFNn1W77dblITTh
 B2ekSpGKEHGEugIunt4nR4c6DunE7mhBecRO18eSn1/uSrPXp+TowO9yplvw+R+kbe+e
 kYGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBNL5BF54A845XMrVxUfkVw15fyYtWyPZyVaOI95FpaVCBue7jOSa+zZuVrW6muPuby4rjVbDHfkfGrTlA4y/c0ISMRlX1tVXC3aQMo5oWwCuJ0aCug4yI
X-Gm-Message-State: AOJu0YyERgD1lpXh9Zh5+4sna1/jWwcuyngGIpyIl4ZGDQMFTINjRiaC
 8ELE/mKYLjRrhj3EG75ehn1uthYBLPKCUeIH3TsmDiL1ndcvjcJX
X-Google-Smtp-Source: AGHT+IEOk2AGdPkr7JjjRj6vF2sVns8SA640c0gyoR1lwxnBMBbazqa3bKt4C73kzX1xoHZE68EIJQ==
X-Received: by 2002:ac2:5617:0:b0:511:519f:ce76 with SMTP id
 v23-20020ac25617000000b00511519fce76mr3986759lfd.57.1707314123579; 
 Wed, 07 Feb 2024 05:55:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUjIt/4gQu1zQesvxRtHLJAF5eS33qGSRoCJO2FtTNPXb1q75lKmjmmgZwe1g+ew0Mphc9I1vYxMMYOLQXkwgdeDq+eHtiMexn/lqKbb0sy9NKkFE/6c5/DL6oNQF+5dy82P79bLa7JDxwu3auc6KaU8xyuInyU5cY0ipGHYsIPOOyGbuJEvaUD5Wa2XtrR2e+9b1f4COALVpyqLPx8CXB7FnpkSorKs7rBrCcZb7jkPzmw++DxjFkXndUd6IheVyeQnOxIuv++wAPTOAyWWv+MhmaeEhqjPbplqioiVcNtJRv3doP0tlmqxml4u+nCPAsDS/ZVc2P9QOWfIF8zEgKckADaRZ+UBdGPoJDk759wqyxLH+8rVtj3ZQJpnKinysqyt9TbFtK4Dd1warPD+Qe6ErZyoaXPbF5BJP91mL66WEhEv2QxrEbIbzZ3IRvUFKasGsj7zt1+Mnc6fkhxjT+/wfi4Fk0ZnjwOOL93IqfUbLGz4b/yBgVUq4INNgji4r68Sm6TiDWpqFLwJ78cMFJay43NGPNUVhuX/LsCS8l35Bsx0/RRC9DVzT462gkTtSFMJpfNaNOh1P8ZVHewQrOda1lGKyeQa1UgIqN3kLsyIncLHQT3rqYkyKzTkP1shgKcXqxyoO2hhZFGIdnAJTi/5zaznFZdpIZzlJ0coO/dvSQCePXO6ZRLE0CLKnOgB+cMy9DVoscSHJ5KvBt8NP61luZA
Received: from skbuf ([188.25.173.195]) by smtp.gmail.com with ESMTPSA id
 gr8-20020a170906e2c800b00a3840fbeef9sm779222ejb.70.2024.02.07.05.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 05:55:23 -0800 (PST)
Date: Wed, 7 Feb 2024 15:55:20 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20240207135520.2zvinnv5w3v7kruk@skbuf>
References: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
 <E1rWbNI-002cCz-4x@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1rWbNI-002cCz-4x@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Doug Berger <opendmb@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Shenwei Wang <shenwei.wang@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 6/6] net: dsa: b53: remove
 eee_enabled/eee_active in b53_get_mac_eee()
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

On Sun, Feb 04, 2024 at 12:13:28PM +0000, Russell King (Oracle) wrote:
> b53_get_mac_eee() sets both eee_enabled and eee_active, and then
> returns zero.
> 
> dsa_slave_get_eee(), which calls this function, will then continue to
> call phylink_ethtool_get_eee(), which will return -EOPNOTSUPP if there
> is no PHY present, otherwise calling phy_ethtool_get_eee() which in
> turn will call genphy_c45_ethtool_get_eee().
> 
> genphy_c45_ethtool_get_eee() will overwrite eee_enabled and eee_active
> with its own interpretation from the PHYs settings and negotiation
> result.
> 
> Thus, when there is no PHY, dsa_slave_get_eee() will fail with
> -EOPNOTSUPP, meaning eee_enabled and eee_active will not be returned to
> userspace. When there is a PHY, eee_enabled and eee_active will be
> overwritten by phylib, making the setting of these members in
> b53_get_mac_eee() entirely unnecessary.
> 
> Remove this code, thus simplifying b53_get_mac_eee().
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

I see the series was put in "Changes Requested", possibly due to my
clarification question. Let's see if I can change that.

---
pw-bot: under-review
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
