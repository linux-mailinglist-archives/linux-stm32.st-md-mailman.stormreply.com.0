Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC269AE514
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A667DC78F83;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E699C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 05:08:47 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-83a9be2c028so19596739f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 22:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729746526; x=1730351326;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h+fsHdO3eEGRLBsyxvQ4eLN0TAO1AeUct9QR19BrA5o=;
 b=lcS7n0r1qq0DeZU3x51RCJGbR/j4pI6zTNwk7381Pb9+Hniy5tvK7+qLgynMjHBvTq
 4govxRZsF9AdWndzntr0pqgoe6G0Mit6zNG17dadSmsNQn/mNUhMfqI6wFV2HG3TQerm
 UGVw0j/I2sfy3bu9xIgjRoawW8oBGsKM/sb3GKam4RNrrC/h/T+BPjAizVSZfMhfHazY
 fe0IgbGZa0Rj49KNvhG705iGOpil6GPA/31aEPlCELkS1fVUfIzqOU6DXQruZavxtP7Z
 7+HEegkpHXTmpxpSt+O6jk9YpQoyur3jSPR96uRuUAwjocYtKRlq3hW6lt6RD4yVzgjz
 rHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729746526; x=1730351326;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+fsHdO3eEGRLBsyxvQ4eLN0TAO1AeUct9QR19BrA5o=;
 b=ZlG70OyhRPMxQdxv8T1GKLejU7d+5JmpYIXrOQbAEjlqQ9bIDQe6kgjIbAkRMqXXhi
 C9qdaQn2969URNoBfU7lBI0LwH4YvsouvRDNCi1BTV174wpGNKncE43L9B05YnkTqN9y
 zC9qbG9/Tm+Y4NfuP+wwRCGm8Zi7WCGQZxoKaKymgfL2ySVnNJH/zvF7AEaCiDyLFUQu
 OHSMRip6Wxb1OMvoWoBBvVCblbVzCd709r4WvN/iLjKgBw9nieOwDOwIikqTBd1jLVL5
 cLVpv6cgzrGWWaglS7QE0GKvKj7PY3dGPUeDBDWWYoyLfqB2aAclYmuOckBt2yWSZBYp
 fK0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL/0QLUd6qkrJpJwsN0V4+FwuuTI6j2TxLo+mPO5Eytm72tMn5fFsDeKh457VnttHSKbTZnDJyEMI2Tg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyBLCs8yKs/pUgQBfO4zCczudn854CsH1cMwkECJ0YbBPsKK0OY
 R1mMX96EXxGJmgS+2NwdgcNFvqrU3Mnh4ff8Rh7ssQDWCIEKRTH8
X-Google-Smtp-Source: AGHT+IG5X1vksF/tv0wq/h048to95RzgD7AYZAZKnCMoZdlNaKEv7NrmBxQKxyy/6w+cY2qtmyTkfA==
X-Received: by 2002:a05:6602:15c6:b0:83a:a305:d9f3 with SMTP id
 ca18e2360f4ac-83af61f1857mr646877539f.12.1729746526016; 
 Wed, 23 Oct 2024 22:08:46 -0700 (PDT)
Received: from localhost ([121.250.214.124]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7eaeabc118fsm7788874a12.70.2024.10.23.22.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:08:45 -0700 (PDT)
Date: Thu, 24 Oct 2024 13:08:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Message-ID: <o46c732wznqvz2p4gkqtjjratxwrgntw4mqballph7fjitvmhw@lylkpsqdp2ar>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <CAJM55Z8SnjQFui0J2hOD34HmBsGqZfxn8e_KAWhXxiqswqv6Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z8SnjQFui0J2hOD34HmBsGqZfxn8e_KAWhXxiqswqv6Ww@mail.gmail.com>
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:39:11 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: net: Add support for
	Sophgo SG2044 dwmac
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

On Wed, Oct 23, 2024 at 07:41:28PM -0400, Emil Renner Berthing wrote:
> Inochi Amaoto wrote:
> > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > with some extra clock.
> >
> > Add necessary compatible string for this device.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
> >  2 files changed, 146 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 3c4007cb65f8..69f6bb36970b 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -99,6 +99,7 @@ properties:
> >          - snps,dwmac-5.30a
> >          - snps,dwxgmac
> >          - snps,dwxgmac-2.10
> > +        - sophgo,sg2044-dwmac
> >          - starfive,jh7100-dwmac
> >          - starfive,jh7110-dwmac
> >
> > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > new file mode 100644
> > index 000000000000..93c41550b0b6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > @@ -0,0 +1,145 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7110 DWMAC glue layer
> 
> I think you forgot to change this when you copied the binding.
> 
> /Emil
> 

Thanks, I will fix it.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
