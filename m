Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E5A6F337E
	for <lists+linux-stm32@lfdr.de>; Mon,  1 May 2023 18:25:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D51ACC6A5EE;
	Mon,  1 May 2023 16:25:06 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52B7DC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 May 2023 16:25:06 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-63b5c48ea09so1963807b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 May 2023 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682958305; x=1685550305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Hi2i6+2A7Vme+8Bw6/DbpVhur6f5/wfyKbNa3KD3XxY=;
 b=gKLjxs75WmlwBqGSSx/wYqqAvwTtUA4KSx3Q+z9o2JPteLVSk0sM2ydoaJwub4ui22
 SOQj3Hr/OBBQGZiKcaY/tkwCH1cFVUf95hckaIUMnP/YmYsiIVwVX2r1KXALMrpR9f6b
 xWcIlT67GL5GhbGiLla+ta52oY22/KZUh4AaEGbasgUQ+MnGDfJFOs7orIE2FBMKq8in
 Y+acU0h3zwre5KQlbqL5v78b0omZIqoZyteSaQciVGjjztuc6SzQK+VW0Yjtzky7hSUj
 DbiFe4R94r9EigM9dVoEVAyvn9qDEsNZHzfQvTwKtsiIvVFNF7UpdSRVaEzMkJASM3Y3
 q7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682958305; x=1685550305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hi2i6+2A7Vme+8Bw6/DbpVhur6f5/wfyKbNa3KD3XxY=;
 b=fzWcwnBXoazUSyr13hzG7UCOA6xca3e1HEyYMx9GtGwqo+EQokr434H0Z4OxRt3Hsh
 cIjCW445Q0plbzbNSysUqbttZujlrJ77ym4ZgDC/34CI87skAlJWTaDz8zwLC7j5CU7l
 X+PIry4rK2rF57QL2r9v/3MGy9dPpuLElEfuGtraq2Q3YW9jI4vu3D3CgiaoQNuUTp+Z
 +B5mUvC28rXaUvwB9oo+AD5Okf6mYIdEUaeBLafVLk4Qd4RaEiKDwpwwk8EljCXt+Ker
 xpr9NSx7rU/o7PpVFll3RsysMTFuhQnUZfS779IZqc7iiYK3JNHUEwhh9u/2mWqiM0BF
 tXqg==
X-Gm-Message-State: AC+VfDzcsCjM4OAXLOAcEPw5T8okbGz8H12aMyZLjS+SPGrhxAoM43YI
 W+W/Zf3QtOwzGDAPVqUHayU=
X-Google-Smtp-Source: ACHHUZ4n14UICtaTafCBlV7ibiarxus3+l8PeLea8hsV8ktohlB6MROy3QkUnTl+1BhcVh+jXYIMxw==
X-Received: by 2002:a05:6a00:848:b0:63d:23dc:7760 with SMTP id
 q8-20020a056a00084800b0063d23dc7760mr21489004pfk.2.1682958304491; 
 Mon, 01 May 2023 09:25:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b6ce:736b:e4f7:adb])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a056a00084500b0062dae524006sm20078819pfk.157.2023.05.01.09.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 09:25:03 -0700 (PDT)
Date: Mon, 1 May 2023 09:25:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZE/n3O6eZRCeBTJy@google.com>
References: <20230426-stmpe-dt-bindings-v2-0-2f85a1fffcda@linaro.org>
 <20230426-stmpe-dt-bindings-v2-2-2f85a1fffcda@linaro.org>
 <20230427161633.GA3112472-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230427161633.GA3112472-robh@kernel.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Stefan Agner <stefan@agner.ch>, linux-stm32@st-md-mailman.stormreply.com,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: MFD: Convert STMPE to
	YAML schema
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

On Thu, Apr 27, 2023 at 11:16:33AM -0500, Rob Herring wrote:
> On Wed, Apr 26, 2023 at 01:21:39PM +0200, Linus Walleij wrote:
> > This converts the STMPE MFD device tree bindings to the YAML
> > schema.
> > 
> > Reference the existing schema for the ADC, just define the
> > other subnode schemas directly in the MFD schema.
> > 
> > Add two examples so we have examples covering both the simple
> > GPIO expander and the more complex with ADC and touchscreen.
> > 
> > Some in-tree users do not follow the naming conventions for nodes
> > so these DTS files need to be augmented to use proper node names
> > like "adc", "pwm", "gpio", "keyboard-controller" etc before the
> > bindings take effect on them.
> > 
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->v2:
> > - Split off the GPIO bindings to their own schema, as the old
> >   bindings didn't even have any GPIO bindings. Put the GPIO
> >   schema before this schema so we can use GPIO in the examples.
> > - Drop nodename and pattern as STMPE is not a generic name.
> > - Add maxItems to the resets.
> > - Make wakeup-source just :true, as it is a generic property.
> > - Move unevaluatedProperties for subnodes right before properties
> >   as requested.
> > - Name devices "port-expander" in the examples.
> > - Use lowercase hex in line init.
> > ---
> >  .../devicetree/bindings/input/stmpe-keypad.txt     |  41 ---
> >  .../bindings/input/touchscreen/stmpe.txt           | 108 --------

Since Rob is happy with the bindings, for the input bits:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
