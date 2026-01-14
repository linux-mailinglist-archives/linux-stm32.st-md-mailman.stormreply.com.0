Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC82D21371
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 21:48:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5703AC8F274;
	Wed, 14 Jan 2026 20:48:49 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A04FEC8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 20:48:47 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b86ff9ff9feso3975166b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 12:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768423727; x=1769028527;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=it8YUnHSXKXXQABJkL2UVvwmRP+gSrkDN7MsvYyaZ9k=;
 b=deRzNUGGkDm+4I7e0RBRNgEX7VtITfMBiqp6dw/qcFOsiYzzYyZQ6YwL0fdSGaUsgF
 4A4PukiGqScdNh8Phh0yNMNAtz1CHobc7LvJy7PN/k6LydZyimPusHsBdsHH9aPF/EYm
 LTRFjrS13obz8pDqpa8KozDri/SYLj9YbpJUfp16iUrjAeWcCcjC3MZpxvNdsdz8JQtp
 cgx1SKzuiiqxCEF4xV5+uNsFuur8ht4cG3oUJrowMnhZIZY+OpRUCWsiP+/aPO9tlNUn
 R9eFg8rXZGHyBX4C33IE/8m9Qg+vrjOy7zNzmkxNrpQqFSdMaoWVYrnER5rVkj6BqDLP
 7Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768423727; x=1769028527;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=it8YUnHSXKXXQABJkL2UVvwmRP+gSrkDN7MsvYyaZ9k=;
 b=inQbCcKrkkN5LhR72MtoHcxlurmE5i9Mz7DTTXvcRQuTSUXFhIewWOuLQ/VECDe3/J
 0LiiV5Im3TrN6+I/+6EVZJY9IqyI007MHyI2D7jdBzumKG3iSpUQgO6QR8Unzh7q0f0G
 E8HiGRVyCWFoWVV/O8B0ldYz2H0QpjTf3gajoZmzYU2F7YO9AqSHtq+c8S+QEZ6rm+NR
 PxOSYcPvz1fSt26toKLhF5APkzpH8Bu5NfF0Xe7fQebRbPeLkB6d1EIV/QVNUFNHDvVI
 7OYoWRgFa8Ngh4cVPDSRx54AguCqIAguR0IDu/3YuRuaP6JuLutZTD6a9Yc8xGcmnLAu
 cQUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8/J2/0u9L31LzWlDimsMhgYw0T4IvKQ+JiA7EzmKpE1utG98TfcHKUmvqTJu5YIoeyf4+pflf2E3DbA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyzS8zt6WczsBDpnj/zo+qnGAbjnqrWUrKc0y4I1bVaS4JjOGYa
 ZXhlkKvBXk1ZXsSLS+CEM1jFekFw/JpAt5d6ResaZ1JtJ2SE63K/RQNI
X-Gm-Gg: AY/fxX5GvARVhQL5FWmLdpAG9Wj2d5An6xk4XGJO3ufhm1UyPBt5IEHaCF5PoF8mMv5
 LLCKGAtwX2HggAhZtTFh6zIV/Qfx5WH7U7zmPTgPwCHGyAY/dGgdZ7080eTdHkedbWvmbbycUcq
 hNONOGiK+y8dQyQEBRZBBUdUgmIiLFd1uyf90ZNZJM+wFa78rzIDUtGMLFbjA8VhfT3l+8PhXBr
 6jiES0WL+oAw48PAyTj4ntqG95dOHRnCdpTWpqUyga9JtrRYJ2bYRjzvwRoclq8rT/OECNpWDx7
 Bwj2p5hQ/kCYlw7Xr3nziMRhpC255Proiyi/OEQ1BGPgmw7ygu13yhD1cP+CbAlIlJpnzgNw4Mx
 82qMpWp9JHgla74sHsF9+eknrBOqP0yik60n0kLoS3q0IyV4HQqXXu3/KaZUJT0JcDyxbPSe9QY
 X5Y7U=
X-Received: by 2002:a17:907:d1f:b0:b87:2780:1b33 with SMTP id
 a640c23a62f3a-b876114f9b7mr180435166b.3.1768423726590; 
 Wed, 14 Jan 2026 12:48:46 -0800 (PST)
Received: from skbuf ([2a02:2f04:d703:5400:9b39:8144:8a26:667e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b870b0dba4esm1111374666b.17.2026.01.14.12.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 12:48:45 -0800 (PST)
Date: Wed, 14 Jan 2026 22:48:43 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20260114204843.e4pyfb64n5jn3wop@skbuf>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vi-00000003SFh-0Abn@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vg4vi-00000003SFh-0Abn@rmk-PC.armlinux.org.uk>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 01/14] net: stmmac: qcom-ethqos:
	remove mac_base
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

On Wed, Jan 14, 2026 at 05:45:14PM +0000, Russell King (Oracle) wrote:
> Since the blamed commit, ethqos->mac_base is only written, never
> read. Let's remove it.
> 
> Fixes: 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG modification")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

I think we reserve the use of Fixes: tags for user-visible issues, not
cleanup of dangling variables. You can move the sha1sum and its commit
title in the main commit message body and delete that tag.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
