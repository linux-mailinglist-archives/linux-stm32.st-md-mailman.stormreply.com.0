Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C1C17AE1
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 01:56:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A6CCC62D32;
	Wed, 29 Oct 2025 00:56:20 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18128C62D2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 00:56:18 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b6cf30e5bbcso318625a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 17:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761699377; x=1762304177;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pezF2VK8RuTzI7DSs1mIZQ9VJH2IBGxZMtiOZQj+jXY=;
 b=FC57G62QGBxDH9nWoQb2VzhFV4ONxZ8Y7jH3SI8pV9f10sRO8F7JR3xakbuLC8+asn
 nlok4Ak6M+N/yGJGgarKKfcGRKTnJsIxh/pWCsFZJqlFRlcvsMHvR5TwNcin8N7izfFN
 5sjgWTfmJPhcApPVauYLs6oPqf+mTP/eYplI3f7+6aVF3dyGAjP8SKqFMC3dCnOuYIN6
 olMVzK67R1g58XT/TF4czK/Ky2/OgNmReEwHIsZ8HHSIsrDjXa73fum/3pdIS70e12wP
 RN+0z+iy3f7D3looT6Z1ee4QwJwzRC5AefrnOCfZJ92/CvbxQDOabwglmw39uEo6I9Ei
 Qhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761699377; x=1762304177;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pezF2VK8RuTzI7DSs1mIZQ9VJH2IBGxZMtiOZQj+jXY=;
 b=dbj1G5IW4XfjabNs6V+3KygUmNCTWk5ybkg4/IH2gef64XEAHLjOKy4fkvp35Ws0p6
 tQs0j/pE0BQsYVtry6D/UXQAWs9HD/47w6jBRZjQL3vcq/2rnkpKUiSNe7wrmjeRkvWk
 S9yvN1w86mET1bkohd+CBhq/OTGz0bXUORyQCc9a5VBwCO5wj0/HoaaxZY+pPXSTk7UB
 RBxRou4AfLmLyrU99Z27wujqovtnNUO02s/bDSBJcpiuHgUuqb45pFr14qe/YgLnvA7V
 OVkTilfZJD61t1peh+bQ7hczNs2k794hCDUUd4FlpL/doCAMdkmfbQurn5PuUS2jRLMT
 Rjcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKTlNFqKfuL4jMpP+WnsutxOedYtPoDAcN8Q3hS+uT/b27zAhOFh9OrK/c4fKnluQX6RrLXdvfYMHvgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwHkTvszU6kZxuFfVRXg4JNnRaxRXHbnq6rINQ3SM/lQjKkf35q
 ZDlSZN+MQ+32VqVelG5W6FwFuB0BoGqc65M3lz/tr+eWaEbz2mJj9rtg
X-Gm-Gg: ASbGnctvars5fnywH628cGV9qWSjMeiU4FQb5Eq4dCqdYWC8acgG3lN+NuvJICdP70B
 JNLC0cM9Ue7V2fH3ORdtrXEDMHm6UGap20jj/a9Todq8kXZ3hZD1Uf+rv5DgQOiavzIgQUkwq22
 xIN/HldJgslop9We50LsGWzaUVsqMb4imdQUljj0hZOn2yatVaVjOvHR199hBerdnHGvlXd6VZJ
 rEBqro+fLSTBkucYN3uQapErLl7kUpWpcw/07STZMWLJtrpzdAg9rpp/c7of0B3b1Q0fNlokaw8
 yx5dFs5LDhrq1jZ76MVFKQ0041T/xHQFqcHkN1bkREdD14r16z9B29V1ERnyabIiaaEo5CYJJjv
 r42Qmt9E0jdIfixRHCj3zvxe+cLji1VdK1kKRVhRpKDLddNKetxMG+vAL2qJi9T6R2amxZRQjRC
 E=
X-Google-Smtp-Source: AGHT+IHOlz4wCJmTj/zx16kQtcK3MAOTVFHMVAoc2+es1wdMlMVDqBf6QFztVnrfW0sWZY15JATnUg==
X-Received: by 2002:a17:903:41c2:b0:26c:4085:e3ef with SMTP id
 d9443c01a7336-294de9f7ae3mr12621045ad.21.1761699377445; 
 Tue, 28 Oct 2025 17:56:17 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d230c5sm130960935ad.47.2025.10.28.17.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 17:56:17 -0700 (PDT)
Date: Wed, 29 Oct 2025 08:56:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <rclupbdjyk67fee2lgf74k6tkf7mnjcxzwcjvyk2bohgpetqt5@toxvy3m5orm2>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-2-inochiama@gmail.com>
 <20251028-parka-proud-265e5b342b8e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028-parka-proud-265e5b342b8e@spud>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Yao Zi <ziyao@disroot.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, sophgo@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 1/3] dt-bindings: net: sophgo,
 sg2044-dwmac: add phy mode restriction
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

On Tue, Oct 28, 2025 at 07:22:37PM +0000, Conor Dooley wrote:
> On Tue, Oct 28, 2025 at 08:38:56AM +0800, Inochi Amaoto wrote:
> > As the ethernet controller of SG2044 and SG2042 only supports
> > RGMII phy. Add phy-mode property to restrict the value.
> > 
> > Also, since SG2042 has internal rx delay in its mac, make
> > only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> 
> Should this have a fixes tag?
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 

Although I add a fixes tag to the driver, I am not sure whether the
binding requires it. But if it is required, I think it should be

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")

> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > index ce21979a2d9a..916ef8f4838a 100644
> > --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > @@ -70,6 +70,26 @@ required:
> >  
> >  allOf:
> >    - $ref: snps,dwmac.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: sophgo,sg2042-dwmac
> > +    then:
> > +      properties:
> > +        phy-mode:
> > +          enum:
> > +            - rgmii-txid
> > +            - rgmii-id
> > +    else:
> > +      properties:
> > +        phy-mode:
> > +          enum:
> > +            - rgmii
> > +            - rgmii-rxid
> > +            - rgmii-txid
> > +            - rgmii-id
> > +
> >  
> >  unevaluatedProperties: false
> >  
> > -- 
> > 2.51.1
> > 


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
