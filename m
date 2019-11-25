Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47C1091BB
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Nov 2019 17:22:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BA3EC36B0B;
	Mon, 25 Nov 2019 16:22:04 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC493C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 16:06:18 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id u189so2341165vkf.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 08:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Avttk0P5txS2q04zBlAty7rtXiGTPj5hhaK38ammByQ=;
 b=e4Es4BNR8tv0qRFadBAbvVXURnUbZZXWCMCs/wpwjIdMh4Jy89Fb9xnhqIRsvSh68a
 XJsKQJopD1tCEgGI9pChnGtQ7DahHVJ9gq9TKnNNNBulwFYjG+CblUqYW/vtQFu8vJxl
 w1v1hYKDkFVHLQgwvtj6is/1xKjCpjQYMwvgLrchL+5ApRlQiLDVacv0DmtKybbB8N50
 CRksIpAlofCr3r2qSaxGOBs8aeFN60Ook6Z7X/RkgjLJ1NolLOSSXCFHCnk9LpFB0T42
 IwuG9sVc4vmuofxHdOc58LsoGlJYDg+KXcNHmcNmwLbz5Jq0N8EXxOIEHDU1Ew05iA6S
 Tb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Avttk0P5txS2q04zBlAty7rtXiGTPj5hhaK38ammByQ=;
 b=Sd59D+gkPtVUTkbh6ugIaduUOOn8z5QDJUu/TD3dcZFNBgIOoVXmU4WHKRUxABpRSc
 sqSGIr5l9gn8odX9T0bZnEwgOeRNNJeyk7Z2KUF42CwU37qEbtntY+Qt0H00Xg755Nqw
 wGd/DNZ0fsIlxPVEdqe0vq99g8ENAZiLfCIh6al2b33NEKRhTlnf926MmdVObjhY9X1C
 mLdLIKpBBr0/67Ppoy3Ky+7qsIorFcRjD27VtxgVNv/NCjCz8RHn8qCmo3VzmYOeAOYF
 LrLJAR4REghFEmylwHkrnOlCj9QVsSRJiXLhGfN8TDYSvH3q8VaaiikLXpfUOIAAe33p
 qCew==
X-Gm-Message-State: APjAAAVy5h8+sVeXbgvG+ZhiMWoXsmIdBAEfE8y1C1RzxeiTiOMoLuDE
 hhwMmNShuRXAtkCa5DLdf3lHmcOi0FumOAUT+EU=
X-Google-Smtp-Source: APXvYqxNasVkK7MWNtHslDqEaSeS5Uo2U4dtls0PYrqWky4egoEbLjLpsDhsWSjOifL4RHlo/J6b+Vdm7rhS/WEKCJ4=
X-Received: by 2002:ac5:ce8c:: with SMTP id 12mr17656856vke.34.1574697977355; 
 Mon, 25 Nov 2019 08:06:17 -0800 (PST)
MIME-Version: 1.0
References: <1574442222-19759-1-git-send-email-christophe.kerello@st.com>
In-Reply-To: <1574442222-19759-1-git-send-email-christophe.kerello@st.com>
From: Steve deRosier <derosier@gmail.com>
Date: Mon, 25 Nov 2019 08:05:40 -0800
Message-ID: <CALLGbRJ00TeZKPfhkqj_mwu9zhMzc_+A8mh4uwaPnFBUatrwTw@mail.gmail.com>
To: Christophe Kerello <christophe.kerello@st.com>
X-Mailman-Approved-At: Mon, 25 Nov 2019 16:22:02 +0000
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 miquel.raynal@bootlin.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] mtd: Use mtd device name instead of mtd->name
 when registering nvmem device
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

On Fri, Nov 22, 2019 at 9:04 AM Christophe Kerello
<christophe.kerello@st.com> wrote:
>
> MTD currently allows to have same partition name on different devices.
> Since nvmen device registration has been added, it is not more possible
> to have same partition name on different devices. We get following
> logs:
> sysfs: cannot create duplicate filename XXX
> Failed to register NVMEM device
>
> To avoid such issue, the proposed patch uses the mtd device name instead of
> the partition name.
...
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 5fac435..559b693 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -551,7 +551,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>
>         config.id = -1;
>         config.dev = &mtd->dev;
> -       config.name = mtd->name;
> +       config.name = dev_name(&mtd->dev);
>         config.owner = THIS_MODULE;
>         config.reg_read = mtd_nvmem_reg_read;
>         config.size = mtd->size;

This would be a breaking change for anyone that depended on
`config.name = mtd->name` behavior. Obviously, if they were using
multiple devs with the same partition name as you were, they'd have
already been broken, but I suspect if a lot of people were doing that
we'd have heard about that before now.

- Steve
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
