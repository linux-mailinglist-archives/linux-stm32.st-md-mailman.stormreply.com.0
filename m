Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAE0D47B1
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 20:36:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24753C36B0D;
	Fri, 11 Oct 2019 18:36:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC2EBC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 18:36:12 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29A1521D7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 18:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570818971;
 bh=F0i5LImbPdwjKpMcjmA3DQC81Y38eji4C5T7CPPrp9o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mCZbRKIe425xYovveqmcmKyiTIqN18mCSZTPJZETib/w2adHOPdoPbKs5P29wVewb
 LeJ3JbCNgIhirIlP4hEOBpsaW7PX2+oypz0kNsqV4OpqVQd6sagxBlRcBQWmjrlyl/
 uuOqYFNbUnXMxfrxp6mFtNSGU0Mxj7hystNB2hTE=
Received: by mail-qk1-f178.google.com with SMTP id q203so9808936qke.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 11:36:11 -0700 (PDT)
X-Gm-Message-State: APjAAAVrFvO5WzoEoheiBz7+b9j4Q3rOkQofnqfATJJyLPg3bVXUw0dS
 o8VmgXoZaYK47SaDh/oOfLO38fwlKvvJvwtNXA==
X-Google-Smtp-Source: APXvYqxMfo6sVYSlq8G32z26ni82A0D4JhoieTjEs0ZK/Y/KBIZd4wZ4PlAcMe6QhlpPLn6YsXah1p9yBvfHROhUg0k=
X-Received: by 2002:a37:98c1:: with SMTP id
 a184mr15988314qke.119.1570818970225; 
 Fri, 11 Oct 2019 11:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191002152125.16227-1-benjamin.gaignard@st.com>
In-Reply-To: <20191002152125.16227-1-benjamin.gaignard@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Oct 2019 13:35:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKWrJjaoHWBrEJuA0qQ2tOzNuzGO6OCtH_Ccmfw89K8QQ@mail.gmail.com>
Message-ID: <CAL_JsqKWrJjaoHWBrEJuA0qQ2tOzNuzGO6OCtH_Ccmfw89K8QQ@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: thermal: Convert stm32
	thermal bindings to json-schema
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

On Wed, Oct 2, 2019 at 10:21 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 thermal binding to DT schema format using json-schema
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/thermal/st,stm32-thermal.yaml         | 74 ++++++++++++++++++++++
>  .../devicetree/bindings/thermal/stm32-thermal.txt  | 61 ------------------
>  2 files changed, 74 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
>  delete mode 100644 Documentation/devicetree/bindings/thermal/stm32-thermal.txt

Same comments on other conversions apply here.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
