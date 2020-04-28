Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08A1BC158
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 16:32:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25989C36B0C;
	Tue, 28 Apr 2020 14:32:30 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8B14C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 14:32:28 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id g4so21739742ljl.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 07:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=psr7yNqTXqMfQvqVzYJ3WgK/XrorFzoihdkLU14qe3w=;
 b=GNiAeQhgB/N+m40azYZMqkMYXjkfb7QkJq/BtD6t0WwK9uLf8zfINMclqp7OsmxGDZ
 H7p5uQXQhNAIxz/85JMYPZgfGGWVucEvqeAs0Vm//oqQLmsZsGxg+GrHGXMbCtJ01BRj
 10tN2AYH7R6BQlgRnqwLhnqCu55YUoKgD/shuGy6qCrkfLGuwBraErTOfjk3qO2zNy74
 UYWFVk7AFpbRGXfapyYzscgE4U207W4wdvXzgCVEC3UCuupa+aZpO6q2HtqwrDmZInO0
 DurvuXNHk81MnOMb/bQv4ZwbRpwTaeQG0pHbo1Fb33CGAWUjuY7RnO68aYP5eZterWHO
 SaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=psr7yNqTXqMfQvqVzYJ3WgK/XrorFzoihdkLU14qe3w=;
 b=uhhDiTsg2xjnND0160WlvZkf1yMtjbV9b3mTXRys0GuubNv07Jh+ND2NGhUHDx0T04
 f7eMbpIkNDAECu9n55fA7yC+ol7jpr5u778yrbbCpqKfkJiPT+LoUYd90p8y7iwvkUkC
 fl30Lp7PN2sQSwqvc6D8q7IZ1o4e62jvxRluuzzwA/udqes2gBLo/tW93IYmR/5jho2c
 CDu/YzGfCwtu+QR7N4WzwjN2fmFb0N16dGxldRcHzV5gkP/4WaoTxZyrABbxpT/NgMlO
 3Vfi6wPINqu+1mceVWgOaSa+46s0bmbNL6nmsGF+MgF6fWd+6Ym/YiVcd1Wgcc4QFL1x
 rC5Q==
X-Gm-Message-State: AGi0PuYxH1zuYGp1SNds1eMXB+VwZYbNGHTig9T6kVPDTYaeAqFpfBxz
 5UUOkPeXDj8JBXp+uwVx/33kPVz/iK9iJwDaVSIk6g==
X-Google-Smtp-Source: APiQypKVikJwVUY4aCnhdxfj2r5hZ+MavanhuJYX2Qu/0kL47XqZliyypaH3vT3ucDc/5Fb1DO9yg2SDlr/F5VKH+JE=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr18610567ljh.223.1588084347589; 
 Tue, 28 Apr 2020 07:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200420134800.31604-1-benjamin.gaignard@st.com>
 <20200420134800.31604-2-benjamin.gaignard@st.com>
 <CACRpkdatGwWyruTLC=+BUtnunvqyxnXAYDhcHqy26oeud8Bs1w@mail.gmail.com>
 <13b16e13-690b-ad3f-a800-28c7805cbb96@st.com>
In-Reply-To: <13b16e13-690b-ad3f-a800-28c7805cbb96@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Apr 2020 16:32:16 +0200
Message-ID: <CACRpkdYLxX-vYypC=9xxuWRQ43v-xm6=LC1shdC2ciH3BtxsYQ@mail.gmail.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: bus: Add firewall
	bindings
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

On Tue, Apr 28, 2020 at 3:13 PM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:

> Does the following description sound good for you:
> Firewall properties provide the possible firewall bus controller
> configurations for a device.
> Bus firewall controllers are typically used to control if a hardware
> block can perform read or write operations on bus.
> The contents of the firewall bus configuration properties are defined by
> the binding for the individual firewall controller device.
> The first configuration 'firewall-0' or the one named 'default' is
> applied before probing the device itself.

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
with this added.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
