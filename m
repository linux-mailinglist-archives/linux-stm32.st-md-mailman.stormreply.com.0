Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ED1510758
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 20:44:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ABEDC6046D;
	Tue, 26 Apr 2022 18:44:15 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E39DBC5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 18:44:13 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id r8so21695093oib.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 11:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mx8P3gHsjLCx+sknIhuvMfqYptVzGGmIORChHd23uSc=;
 b=0iG5VbaIgGbtMvFbUcy/piPtybA66zeJdqI9z68F8AJsryqNOCobaVh24Ri3e0jCIP
 zToXOjxl0yrh5LfnymINtwLAByZzjgjOSI6kxsuh1oe3buxPU4wtlhG+MFLAwakDe55A
 y0y4kMab+LATiNBZGIZBx/MNGcjU6229Ef+H+XD/wWFN13A1jZKyjLUDr2zfPx0JTV7c
 eVNN92TmwcIje6C6sd45vN9Ncynw12Syp38hGBT/dBx0wBzKrtHycwvwhsU240QRLe53
 YiA/lV6sHy5ztqum8WivpZrUP46gRWhzIDYwgm4W2Jfwk1x/Xy65sZ/sQ/SlFNMwlazx
 KopA==
X-Gm-Message-State: AOAM530eGXDS0cgrjReXbJydfTWYYHCh96XdlESA0waW38NDqMhx2kLl
 +2xz0jxS8U/aM77XZf97Kg==
X-Google-Smtp-Source: ABdhPJxGVx6HmAUiBu/kUnqmIEoBY/yWAcaWyhG1G4W0lFdInZBsLOspIDqniFb2T3g2odMs73GLNQ==
X-Received: by 2002:a54:4e92:0:b0:325:224c:8ff7 with SMTP id
 c18-20020a544e92000000b00325224c8ff7mr5742089oiy.154.1650998652766; 
 Tue, 26 Apr 2022 11:44:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u20-20020a4a9e94000000b003291f6ac4b2sm5937954ook.28.2022.04.26.11.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:44:12 -0700 (PDT)
Received: (nullmailer pid 2332829 invoked by uid 1000);
 Tue, 26 Apr 2022 18:44:11 -0000
Date: Tue, 26 Apr 2022 13:44:11 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <Ymg9e7sWaFSuNR0a@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com>
 <dd48a7b5-ce08-5fb2-8236-8802ac91d827@denx.de>
 <YmbyUc5uTXoTD/nt@robh.at.kernel.org>
 <a6fa8050-1860-fffb-e7eb-6603d2e0eec4@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6fa8050-1860-fffb-e7eb-6603d2e0eec4@denx.de>
Cc: etienne.carriere@st.com, devicetree@vger.kernel.org, arnd@arndb.de,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/8] dt-bindings: clock: stm32mp1:
 describes clocks if "st, stm32mp1-rcc-secure"
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

On Mon, Apr 25, 2022 at 09:35:13PM +0200, Marek Vasut wrote:
> On 4/25/22 21:11, Rob Herring wrote:
> > On Fri, Apr 22, 2022 at 06:31:25PM +0200, Marek Vasut wrote:
> > > On 4/22/22 17:09, Alexandre Torgue wrote:
> > > > In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
> > > > security support hardened), "clocks" and "clock-names" describe oscillators
> > > > and are required.
> > > > 
> > > > Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > > > index 7a251264582d..bb0e0b92e907 100644
> > > > --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > > > @@ -58,14 +58,8 @@ properties:
> > > >              - st,stm32mp1-rcc-secure
> > > >              - st,stm32mp1-rcc
> > > >          - const: syscon
> > > > -
> > > > -  clocks:
> > > > -    description:
> > > > -      Specifies the external RX clock for ethernet MAC.
> > > > -    maxItems: 1
> > > > -
> > > > -  clock-names:
> > > > -    const: ETH_RX_CLK/ETH_REF_CLK
> > > > +  clocks: true
> > > > +  clock-names: true
> > > 
> > > It looks like this should rather be a property than a compatible string --
> > > the compatible string is used by the OS to determine which hardware is
> > > represented by a node, but here it is the same hardware in either case,
> > > "st,stm32mp1-rcc" and "st,stm32mp1-rcc-secure", it is still the same
> > > STM32MP1 RCC block, just configured differently by some bootloader stage.
> > > 
> > > So why not just add one-liner property of the RCC block like ?
> > > st,rcc-in-secure-configuration
> > 
> > Because using compatible was already decided.
> 
> I see ... may I ask why compatible is OK in this case even though this is
> encoding a policy (secure/non-secure configuration of the same clock IP)
> into DT ?

I see 'compatible' as an encoding of what is the programming model of 
the device. Secure vs. non-secure have different models. PCIe hosts vs 
endpoint mode is a similar case where we mostly have 2 compatibles (but 
not always).

I wouldn't say which way we do things is set in stone, but in this case 
we already decided something.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
