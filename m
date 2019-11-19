Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9939102BA3
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2019 19:21:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70CA8C36B0B;
	Tue, 19 Nov 2019 18:21:21 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B9D5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2019 18:21:19 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id q28so17898643lfa.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2019 10:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0dUXKYCswQ0fk3ChDtCHMcNLvLahQKNVxckNHbLK62U=;
 b=e5lESrFN8MyoYepnYPws1P7yf4C1dXiYfMOkmezNqIXAiZCpH6SxlKI9ix3SlSORNf
 /5JsXZyp1E+IjqGqwMhUYHulRiSh9QJkMf1GIFQllRE77579xVcB4EDXytX2AWhcMFvQ
 1ksK6LpTugAMceaAYTPHCvwtSWDKN7rqeIueDTbWQtIHR4HQydG5oXkfTtYGFdaIoyjU
 CylOl88XU0mV6aCUOh7u/8Q+Yga6rgxzX3jS4Uzen0MivFUrqkq6uYhpdWXn0ASFSQew
 25whUzIeI6GQW/U3sk+CCl9AnoSAUrolJLK0fI3TEVzTWkTXjIjQqrrTPxWQjG7LKd5E
 juzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0dUXKYCswQ0fk3ChDtCHMcNLvLahQKNVxckNHbLK62U=;
 b=GCvYWSbXSTH/r431bbxgvUW8ldfSvZsVtCv+MOr8wmsA4Eqe3DoECCp0avFueR9i7/
 u9ziL2ZvAqEruSXvlYcNL8b3X75rI9vUTUOOtXTlKlmAvms3z1VMS7ZEXvWFJ2wzvlDI
 F8/UzXRuf/Be5jud75E59fHODIzJRMJiX/aBQ5JwvfSo6xdrdr4KfAn7Rqexlnv2nuIi
 UKTYNU2BIa/5dzy+ut61SKsx33SgHehItqXWGdr1F3xC/j/YphNg0aje/ss1JcXEshh0
 tNpX5t9YN+ZpdWRthX1mU4zIztmAo77gJCc+FBSvjlRxL+gXGfcro3MdDnk3zpstZRP1
 6jpQ==
X-Gm-Message-State: APjAAAXx11ZyftMmSv+Nh7pQ2IDzCUs1IhOn0tUNDT2tAu5ZQ5Jnd+iS
 rJoHErMcFwal4RiIAp1QkvX15Xw12msawTPMD+4=
X-Google-Smtp-Source: APXvYqzVzn1n+QdLBDwkgCKvCRCAJA5gUf/1Cpb09fd0k1gg5uwHXZcpoFJbgiH7FOKqOuf17TVa1Ixb5NlB5WAK620=
X-Received: by 2002:a19:4318:: with SMTP id q24mr5172404lfa.12.1574187679050; 
 Tue, 19 Nov 2019 10:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
 <20191118152518.3374263-4-adrian.ratiu@collabora.com>
In-Reply-To: <20191118152518.3374263-4-adrian.ratiu@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 19 Nov 2019 15:21:14 -0300
Message-ID: <CAOMZO5C5gpW6KF9d-79wd=-7ZGAbXQLAXw3kLi+_5DBW_DYrTw@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Emil Velikov <emil.velikov@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v3 3/4] drm: imx: Add i.MX 6 MIPI DSI host
	driver
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

Hi Adrian,

On Mon, Nov 18, 2019 at 12:25 PM Adrian Ratiu
<adrian.ratiu@collabora.com> wrote:

Some nitpicks:

> +
> +config DRM_IMX_MIPI_DSI
> +       tristate "Freescale i.MX DRM MIPI DSI"

This text seems too generic as there are i.MX SoCs that use different
MIPI DSI IP.

Maybe "Freescale i.MX6 DRM MIPI DSI" instead?

> +module_platform_driver(imx_mipi_dsi_driver);
> +
> +MODULE_DESCRIPTION("i.MX MIPI DSI host controller driver");

i.MX6 MIPI DSI, please.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
