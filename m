Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA8BCCB4F
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Oct 2019 18:39:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0B4DC36B0B;
	Sat,  5 Oct 2019 16:39:57 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7659BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Oct 2019 16:39:56 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 7so9523626ljw.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Oct 2019 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vPHHQsCm9P5lZAOoBEEQkMv+jTLHYjpWxfU2c8iJm+s=;
 b=km/R+P3zNivGmATXsVjC0pwOaNaLVsp770WNbE2ZdpnVhPJLTNALAk1pY+eMZE8pxA
 YkojbQcoOTs9kZM5JOF2Rv46YYNSaKgBPCmQW9HOvbS96RPuJAla8Sb2VPqcElrCO5UR
 2/6Sh6fMfSddcEzFcz14tMESk62O3II7RDYFrnC07gcpY0285wxcVavUiG4u/u7lIT8k
 Str8vwDdfk6qaSpKCDpAnHPxIlzLBsALXel32/ueZHebYUHkyCAb/fvINXvtN+ErP4hp
 AyA6Qc+BWhszgGMCLMW3ME4lR8pJoWEG1nEZYcfMy0G/Z1RZcXMUMIAIqKhzlESl60G8
 HHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPHHQsCm9P5lZAOoBEEQkMv+jTLHYjpWxfU2c8iJm+s=;
 b=TmlOOPIvQevgt1dFQXAwcLvSK2i+mfMLAWW5GdttzZ4FwwfhuW919MJO9rV8pwV0oH
 R7My5xzg1AxiuDN2dQx2xISZ+SPqsRKU0gCx+GBWT1fcz40xNPGbH/9Tj3krNPRl9PzH
 Gw2M4MLGTlrVPGulWslpqRtcI8R5LK1Flrg6k4swueOW7BsHKCDqDEYtY132ru010Jku
 cDu8S6vR1+ubTBVY1UuNlnmoly8Nx0Lncnc2hJQf5NycUKDO4bngqodDgMpspW/V+kps
 VZPANGROhJcMQM0wZhDBzReTn+Pj+eoREdQr95ZSfEfM/U3/OwzFAPAJAlCeLX62QuOK
 pQ+g==
X-Gm-Message-State: APjAAAX8E7u40fkau/uyS1KLNUho2TfAyp0YVED5juFkeLTsfx1aWtDg
 OHPMszY2R9tJUDzmcEgKHQJqTZmWs/BVqT98S1ycDA==
X-Google-Smtp-Source: APXvYqwgSpaaFyzXdZShSpDLB3i/tHQGn7PDveIUsSUQrgOPp7Y4zvvhnbMGw/WaUGyUixEqB0xsj3nUp2bpy3kvhqM=
X-Received: by 2002:a2e:894b:: with SMTP id b11mr12889974ljk.152.1570293595719; 
 Sat, 05 Oct 2019 09:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191004122342.22018-1-amelie.delaunay@st.com>
In-Reply-To: <20191004122342.22018-1-amelie.delaunay@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 5 Oct 2019 18:39:44 +0200
Message-ID: <CACRpkdbhoAp7Zif_7pbvJLoFeLdbT9u+RRgZk94cJEH+NadBmA@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] pinctrl: stmfx: fix null pointer on
	remove
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

On Fri, Oct 4, 2019 at 2:23 PM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> dev_get_platdata(&pdev->dev) returns a pointer on struct stmfx_pinctrl,
> not on struct stmfx (platform_set_drvdata(pdev, pctl); in probe).
> Pointer on struct stmfx is stored in driver data of pdev parent (in probe:
> struct stmfx *stmfx = dev_get_drvdata(pdev->dev.parent);).
>
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
