Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E820F14C
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2020 11:14:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 436C3C36B11;
	Tue, 30 Jun 2020 09:14:07 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6A1BC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 09:14:04 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id e3so2621980qvo.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 02:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=goGiq75i1r9UL5Bg9QEBSzEo+ZjMGYFQePVSHu+1Wss=;
 b=p4g1le9/ZfF8ilquMjXqNMPvi8RiOh9kTjkToZUu3WyBU++LirvbrgkQ2h6Bpf877K
 cYygMEY+jS7/cpIyNcFb1rQcKtotPZr5PTnakDOxRpMtSjb54dHI31e1N1b/hWSa07r5
 HyefN36kstRQuh6GF3RPPy5+F8KJ3yjqQnSG/dsmh8x4fYTPaHuosfNtJ5yPz3ijeBXs
 hbxpZ9SDS3SW7Qg7t6XO357gC63oKuabATS6UhqWjc35Qm6rs65ZHvJNehPaZoVTR3JF
 Il7X5gOb/qraRnOM887GonIo46XEfKfz+aRm5zk8UIQN7GTbSXWL6InIx51H4VG09t86
 W1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=goGiq75i1r9UL5Bg9QEBSzEo+ZjMGYFQePVSHu+1Wss=;
 b=Qv0zAQdUkGROqtIEjDDtZkMVhhqB8C50UmvBJBm8ISxpB96we+GGVJSZHWa3ns7H5z
 gJSKIAbhQuFyVGG6zYaYgrdVj5I+Py/ANwpmg20cWQLCUcZQVuEuTVvLKjQhS6Ls6Yir
 ao5JUPZogxFwLZ05ciFGCQWxQqXlEgtYBwr/SUjhcmkSbLBX1QvrCtxBwj867elOY08k
 4o8sgTHot849ndII2aev9svLY9m1n6uwBYLd8xy8ZyOdEsJsj5iQaxQ9SZs28Vz1pbIJ
 bqVkLaLsX/mTErrhtt702mNJRT3tJWE024/ywDkUVNEB2dXVeIfRw2aACIkqnhjw+272
 I+Mg==
X-Gm-Message-State: AOAM532KRmYVSbED855+bgZ4RcQcbvI5vWyPPOeDX1ZO6IIT5HdJdtiT
 lHMESF8Y+hLSbVYAqi8bKVYgHi664bewKjk/YbE=
X-Google-Smtp-Source: ABdhPJxEorLd2eAYPtaEGcI5F8EpfrHsypfMl7/Fu8I7Xbr0FcWZSr3cSenpQxQD5tD7gaEocYzMslPBrkwzWe8rPTs=
X-Received: by 2002:ad4:42a7:: with SMTP id e7mr19066154qvr.212.1593508443740; 
 Tue, 30 Jun 2020 02:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
 <1591975362-22009-5-git-send-email-christophe.kerello@st.com>
In-Reply-To: <1591975362-22009-5-git-send-email-christophe.kerello@st.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 30 Jun 2020 11:13:52 +0200
Message-ID: <CAFLxGvzfh1Qa_gM9bZAxaoCbO6xCoNdaPN=Ea20Up_zPVgjugw@mail.gmail.com>
To: Christophe Kerello <christophe.kerello@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 arnd@linaro.org
Subject: Re: [Linux-stm32] [PATCH v5 4/6] memory: stm32-fmc2-ebi: add STM32
 FMC2 EBI controller driver
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

On Fri, Jun 12, 2020 at 5:24 PM Christophe Kerello
<christophe.kerello@st.com> wrote:
>
> The driver adds the support for the STMicroelectronics FMC2 EBI controller
> found on STM32MP SOCs.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
> +       if (!IS_ERR(rstc)) {
> +               reset_control_assert(rstc);
> +               reset_control_deassert(rstc);

Shouldn't there be a small delay between assert and deassert?
Other than that the code looks good to me.

-- 
Thanks,
//richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
