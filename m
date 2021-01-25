Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2B302587
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 14:33:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20B1BC56639;
	Mon, 25 Jan 2021 13:33:18 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE6F0C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 13:33:16 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id o10so17696279lfl.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 05:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L4R/wl3TDCRclCdmZUfeMtDP0T5U411eEJj27c7YynE=;
 b=vtEe/N1ZmZ6Sl95ijm7xhnVcVMDIiPgQn3B1Zk7BbNlmSXhDhonrNJVUrvrEOmRl31
 n+bBVKKmdlWBnuq6jwTEoMGMeQKCsxfDLbu7L9IL6qOzppHBhq18Dw6NKWB1PYwQt3yg
 rL2R6XOfWpwHsruEKJKuWeS52N+CCWMVTGkbP9zOSLljpxV4oGByj5scciQxnDFVPklF
 ETuPOgsUqSnmXb/Od0f+KgKf2lwcTCLTa8NhL4jnyrebVJm480ZtXAJ5XMjEp/soCrLl
 dBZRHrLkEKijyDzHlTgKnXfgXZVVr5ApDcdGB1q0eNtNYputeooewEsT9e7afBdtDq/H
 upFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L4R/wl3TDCRclCdmZUfeMtDP0T5U411eEJj27c7YynE=;
 b=qfU/1z3JfXsAd4op3l1w0xuSa4TL5fC4h72a++OnAomy2VJ9CtXR2IPV4A7kr3JnzG
 5kfWi7uohbqogoTMdnEuAnhmUnrwtEeq7sCaOh1DFN4zz4+Rxh9M6tytWjUbQmxne0m5
 Bw1ahzr7j3OiCfthPur43dPtMhscYWDz1cu5auPFviFxJzYFGuei5I91Dc/uRTMfqHwE
 GkpPVTQ8qOuIGagcgyJasviVKvM72tAHv/SKD7y5OkiK4xgpSPHsSvf1SPUzi3OuFHsV
 1k8L+rDJwemd6ol+WOK65BnnqxuZ+VJ9z8dTW0jJFioj3zr6r9K+4iRnxL/rPLVAZUca
 MzFg==
X-Gm-Message-State: AOAM531wGQTOsErO9qJSPnJYdabMIu7MN/lylpXlvuM2mSf12yaVgXu0
 07u9JFV+WSJZCyEpBkt9wbRKY89xT8qzJGpV6MJ2yA==
X-Google-Smtp-Source: ABdhPJzIYl0XNdKXzQjkkZZ6qYmMBvr3r3ONv9DtPEzzZpl4dtywviUhglPRlZYE0y3qz8iD/SWMLszr9br1P5H0zVE=
X-Received: by 2002:a19:fc06:: with SMTP id a6mr274138lfi.529.1611581596094;
 Mon, 25 Jan 2021 05:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20210124170337.32917-1-marex@denx.de>
 <eb8c62eb-87c1-0011-49ae-260239daf79e@foss.st.com>
In-Reply-To: <eb8c62eb-87c1-0011-49ae-260239daf79e@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Jan 2021 14:33:05 +0100
Message-ID: <CACRpkdZi6SeTa8_R6+8W6gZpSOshJg+ziXUx-Qi5mcsUXMdMvw@mail.gmail.com>
To: Yann GAUTIER <yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2] ARM: dts: stm32: Rename mmc controller
 nodes to mmc@
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

On Mon, Jan 25, 2021 at 1:58 PM Yann GAUTIER <yann.gautier@foss.st.com> wrote:

> Do you know if similar patches are planned for other platform using this
> IP (Qualcom, ST-Ericsson, Arm vexpress...)?
> I found issues with them when running this command:
> make -k dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>
> Maybe Linus already sent the info?

I sent patches fixing the Ux500 and Nomadik platforms.

The ARM platforms use mmc@ when I looked at it briefly but
else point it out to me and I'll fix it up.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
