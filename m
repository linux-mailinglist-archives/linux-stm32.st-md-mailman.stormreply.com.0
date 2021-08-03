Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 564BE3DF68D
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Aug 2021 22:45:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00C44C5A4D3;
	Tue,  3 Aug 2021 20:45:25 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8165CC5A4D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 20:45:24 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id k9so720318edr.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Aug 2021 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ZbatCuwF0ejzY/254BQh4plkI8mltXs2twaQnckgMI=;
 b=p6BnMCoQVqlyPBcxlHpgLvhxDtbmUN84h5PkOllCD755g4MCf/UKkPDMAXladxB+fB
 ItXeBPNZU1eu9qpp2s5qRNf19y0GWfCc4yrZUM81hGss6a03DsR62OdzljQaK7beX4u2
 6O0AeUatpKRyCVLH5f1CDB73J/mah8Eangexn4iulbgM3QdMIK10G8SMlbKBxBPMIQV/
 H2hRARFM/WDnnDj9FIHnoiBbr7QTnZbd/iubtmfctpxrvCom9vD8ZBXQ2iDcgfyIqucm
 Y7GGg4o3zIqe8U26oZdecITIO1v8XS/OujFchRVeQHCvAUQFxXRFEueD3DvJ3VSMbqOG
 vt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ZbatCuwF0ejzY/254BQh4plkI8mltXs2twaQnckgMI=;
 b=tic5jtAuH8jvg3GQOzUISXz/oKKr5RVMIZdvvZw0xTizqwzd/0yISiofhpqgoiNabs
 XgKtpyBGEOB3jBIopZZHJQYZXQDllIdS6wXIoum+0+2nV6GCROgIVXO3Sk8wzvT4BQso
 sNoyePwW+qwQooQXWFVyjG3SM+CZVdTde1EqfYrmTjsyDYDksmB0bTAizOiYHfOyc8/P
 OhTKvRfK644mgv0rX5trkMGWxGzCtWCHI4RVp9DaHI3TD6ISnprxlFb/npgFWFZTpSWh
 Y0U9tJDKd9Eggp1RHtTXGDFbbVRMYMJyKQ4C+p3Tyy2egvwTYT0jIeKpEV4AW8G+89nz
 QC/w==
X-Gm-Message-State: AOAM533RjQAJi1UwK48eo1CEwqJpu2pQ134S40kH8peY8OMwmWbHie2+
 NYDU+qI6i6XFcwOTlQeyzoWP2uiVHVcrKqEXn/g=
X-Google-Smtp-Source: ABdhPJxRXiJDPGTIfneS7YyQ40d3AXe1t8qEhKVPNz8CIijfGmO3fHXUd9wo1ewgVlv71M9TOcDpUS40b9+EssDoF4k=
X-Received: by 2002:a05:6402:54d:: with SMTP id
 i13mr27685680edx.179.1628023524096; 
 Tue, 03 Aug 2021 13:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210729201100.3994-1-linux.amoon@gmail.com>
 <20210729201100.3994-4-linux.amoon@gmail.com>
In-Reply-To: <20210729201100.3994-4-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Aug 2021 22:45:13 +0200
Message-ID: <CAFBinCAVaaXd+jXBtA9RETP5AavOfeUVZLkU1ohGT2Lmx+H1cw@mail.gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCHv1 3/3] net: stmmac: dwmac-meson8b: Add
 reset controller for ethernet phy
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

Hi Anand,

On Thu, Jul 29, 2021 at 10:11 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add reset controller for Ethernet phy reset on every boot for
> Amlogic SoC.
I think this description does not match what's going on inside the SoC:
- for all SoCs earlier than GXL the PHY is external so the reset for
the PHY is a GPIO
- the reset line you are passing in the .dts belongs to the Ethernet
controller on SoCs earlier than GXL
- I *believe* that the rset line which you're passing in the .dts
belongs to the Ethernet controller AND the built-in MDIO mux on GXL
and newer, see also [0]
- from how the PRG_ETH registers work I doubt that these are connected
to a reset line (as they're managing mostly delays and protocol - so I
don't see what would be reset). This is speculation though.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/553e127c-9839-d15b-d435-c01f18c7be48@gmail.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
