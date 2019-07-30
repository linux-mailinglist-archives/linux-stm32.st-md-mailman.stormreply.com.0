Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B3F79F9F
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jul 2019 05:51:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFECAC35E01;
	Tue, 30 Jul 2019 03:51:19 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05EC1C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 03:51:17 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k8so61216330edr.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2019 20:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ISIVHu+AuwTJR7JUopUzw4hbupo9+MlQhSrhmHZcakc=;
 b=W2QvHQ6fbkeIwoIWyO32E0Thmg6E8q524GcnkF7uSxCEHs/Nl2rmi5DEA4SXfyruEI
 NPxY3SlgFCLQVOgIhXFUjkRcqZewZdep7bKKHlXa52tA2VKuzCGdJtwYCKFoEpiyxGC5
 P5vyea3zmHE+dnTOqGoJQJPODhW0vOe2g5CmCxd7rIE/fMHGavuiiYg4OCHjvtNt/WcJ
 IoPNptOxS63MrUMOQ+5nVpZolrZdhHp3eHrVYiO6xwT+G1UowJPflA45XDrVJI5Ds+/S
 Wk3zdtLK3F/e8gB4AzE6k+ah4IhreXOIxLph3Xse9xhQ6Y06bwnd6dY0g2QpMgETbAgw
 9doA==
X-Gm-Message-State: APjAAAV4WXibv1JOkAyeNhPBGPj3QMqFjYuIEs/cRhwtE/U8/UQlPx13
 5whIQftrUcEa7xD5HmsvjORAoKVJ5WQ=
X-Google-Smtp-Source: APXvYqxtYlTWmSqF6UpBH/Hu7ZZi5IL5d1CAalzuRV6uGHDsztgtMlQEscPTnld0qR8opIP3Czy1hg==
X-Received: by 2002:aa7:d68e:: with SMTP id d14mr99374299edr.253.1564458676490; 
 Mon, 29 Jul 2019 20:51:16 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id j30sm16200342edb.8.2019.07.29.20.51.15
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 20:51:16 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id f9so64039719wre.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2019 20:51:15 -0700 (PDT)
X-Received: by 2002:adf:e941:: with SMTP id m1mr37011261wrn.279.1564458675544; 
 Mon, 29 Jul 2019 20:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
 <a1a33392c64c71099021fb49cc811a30790d40a8.1561649505.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <a1a33392c64c71099021fb49cc811a30790d40a8.1561649505.git-series.maxime.ripard@bootlin.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 30 Jul 2019 11:51:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v67u3pvS1veHTHVPySK1YGJYwGzPF7-iziefsbWRNZNyrg@mail.gmail.com>
Message-ID: <CAGb2v67u3pvS1veHTHVPySK1YGJYwGzPF7-iziefsbWRNZNyrg@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 13/13] ARM: dts: sunxi: Switch from phy
	to phy-handle
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

On Thu, Jun 27, 2019 at 11:32 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> The phy device tree property has been deprecated in favor of phy-handle,
> let's replace it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

This patch breaks Ethernet on all my dwmac-sunxi, i.e. old GMAC, boards, with
the following error messages:

    sun7i-dwmac 1c50000.ethernet eth0: no phy at addr -1
    sun7i-dwmac 1c50000.ethernet eth0: stmmac_open: Cannot attach to
PHY (error: -19)

Reverting this patch fixes it.

It also breaks the A10/A10s, but that's probably because the sun4i-emac
driver doesn't recognize the "phy-handle" property.

ChenYu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
