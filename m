Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB414181CAE
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2020 16:45:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 968F6C36B0E;
	Wed, 11 Mar 2020 15:45:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E646C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2020 15:45:01 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9798320755
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2020 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583941499;
 bh=PFGUByZEZTBls3DOx4QmCSCySBxN4HHWWP3hytIxz6k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B933aFpcNlMJxmS8HIBv1ozND2nqR1JpFud+7CWKxeDc9Iy0XBV44M5fNbDRY5Xl9
 vm3dG6mVkT9Yg6CMQ7i8ect5XDgIYYnz1EaF0Avd4vGhfg4PsJ48QSaZ9BkQyfU3O4
 jSMb0T8qX71Ap4tF8QRvB6t/NL5+pK8ob/tWNIUY=
Received: by mail-qk1-f179.google.com with SMTP id h14so2510079qke.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2020 08:44:59 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0+GNPJD+5+WxiY1K+5GlvCEEH6UQDl8c02nnmmZ3cHSnsfDYLB
 O/LJ8IVLcb6WHKob08J6ALFd+FP0ocVyZLYxFg==
X-Google-Smtp-Source: ADFU+vuw15q6epFZCXVJuZ1Xg31IOj2uW3MXifAIuvdbqLoaajvp1prFnelurSmWkqVzjoRj7mM7gpt70hmkQJ36bhw=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr3442629qkg.152.1583941498611; 
 Wed, 11 Mar 2020 08:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200117170352.16040-1-olivier.moysan@st.com>
 <20200121220022.GA12737@bogus>
 <6a49bf6c-8851-a65c-5606-563776e07c08@st.com>
In-Reply-To: <6a49bf6c-8851-a65c-5606-563776e07c08@st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Mar 2020 10:44:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKGy6Ec57RC_N-KZfKgGij4nn-BEdNQqXCd9dH_yPY6ew@mail.gmail.com>
Message-ID: <CAL_JsqKGy6Ec57RC_N-KZfKgGij4nn-BEdNQqXCd9dH_yPY6ew@mail.gmail.com>
To: Olivier MOYSAN <olivier.moysan@st.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3] ASoC: dt-bindings: stm32: convert
	spdfirx to json-schema
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

On Wed, Jan 22, 2020 at 3:20 AM Olivier MOYSAN <olivier.moysan@st.com> wrote:
>
> Hi Rob,
>
> I did not report your reviewed-by tag, as I have made a extra change in v2.
> This change is related to dmas property reported in v2 change log.
> Sorry, this extra change was indeed not clearly highlighted in log comments.

Indeed you did mention it, I just missed it. Anyways, it's a minor
change and my R-by still stands.

I'd resend this to make sure it's in Mark's inbox again.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
