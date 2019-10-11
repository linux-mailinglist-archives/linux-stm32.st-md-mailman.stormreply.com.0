Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A78D47A8
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 20:35:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01C74C36B0C;
	Fri, 11 Oct 2019 18:35:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB34BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 18:35:08 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7724206CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 18:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570818906;
 bh=VrIjCjeCJtSwwOFvAswWO8zYeoA6k350yygwzNFOqds=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Uf+6ZDO1znTClCJfgItB3zWCf/PrHoKnUZNzgxU7bq9CV74H3xLyxry5prNwCD90E
 cHV2PbrAT47N65ENH7+SeQzgduJrVnf8TYw0r1URPqCvvRBGijV2L/z0agwDzqlCmM
 tK4yIyp6asvn0ngHMlsN083OpACx/m0LgG52TtvU=
Received: by mail-qt1-f177.google.com with SMTP id u40so15187283qth.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 11:35:06 -0700 (PDT)
X-Gm-Message-State: APjAAAVvP8ZFbvi9EJQ0qNZFQpgi1LUwKJQ9gS0EiSp5AKraLdlc0SEe
 qBv+DuuW4ubAm6/8MPD7mVAgv3aTFL6o+1KRDg==
X-Google-Smtp-Source: APXvYqxXNZXqhjX1vv0yrBQ2zPizCbCr6wZ3R6Kbqa0L34qgtUc+z3yI5+jQD/V1ZY3gsinMlNgwXR23TqSfelUsfUs=
X-Received: by 2002:ac8:293b:: with SMTP id y56mr18601675qty.224.1570818905926; 
 Fri, 11 Oct 2019 11:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191011131018.24035-1-benjamin.gaignard@st.com>
In-Reply-To: <20191011131018.24035-1-benjamin.gaignard@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Oct 2019 13:34:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKboUPGFcz5SPA46WDxTa7aYSF7FN8LHhi4SFOz1PvrfQ@mail.gmail.com>
Message-ID: <CAL_JsqKboUPGFcz5SPA46WDxTa7aYSF7FN8LHhi4SFOz1PvrfQ@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: hwlock: Convert stm32
 hwspinlock bindings to json-schema
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

On Fri, Oct 11, 2019 at 8:10 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 hwspinlock binding to DT schema format using json-schema
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> change in v2:
> - use BSD-2-Clause license

I asked for dual license: (GPL-2.0-only OR BSD-2-Clause)

> - use const for #hwlock-cells
> - add additionalProperties: false
>
>  .../bindings/hwlock/st,stm32-hwspinlock.txt        | 23 ----------
>  .../bindings/hwlock/st,stm32-hwspinlock.yaml       | 50 ++++++++++++++++++++++
>  2 files changed, 50 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
>  create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
