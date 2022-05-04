Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9872B51B191
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 00:03:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 138F5C6047D;
	Wed,  4 May 2022 22:03:23 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9C6EC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 22:03:21 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2f83983782fso30739697b3.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 May 2022 15:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Op8es569RzvtJx0t1HAgKK6+F0dCry24CEKKr27rhw=;
 b=YpEazHzrG3OrKDD792Y+Ce65dO3svHKo+t8eTblPJlkPv7mx0Hi6FUn/maUA01DsDT
 YN6wImNIZVkB3x2NFutEPQRWBGR3V7q8eYzLmhBNMXyGRhYlWurl8gLON4jWX/jlIfSk
 x7R13SPo5LgJBnM0PSJ3HyutFTeKbDvWCR7AroFzNQ3UOSAEDY7zT+r8sbHza0VcKWPZ
 eLqTnbbyjFb6HoFzZ6fvD7nkSsIWAUFE/RSInIvkQ8pPXcgkSP1c/CGqbsdYDf4DWcWd
 POFgXJPHlxF/3hIroXtOd4LkCDhM+j1HSL3kZ0TbXXXzH41BWgvsECFDu3hjQojX95Sx
 nvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Op8es569RzvtJx0t1HAgKK6+F0dCry24CEKKr27rhw=;
 b=saD6YSlu7yi3MnRSprKVCV1aAMR1DNX5E2OfnkJoiQvj5b/nkeOCAAo3X0tjnrZlgG
 NvwRrEecwLTcCMRd1DaKVglk0bOoqs1lleQzjBiOX5v7SkZdB6j4B3xvVJrnGMLjbNtJ
 ib7GmPaBapFzSsixVuiSIugfwV0428SvpEfBs8749CSNe8vrAbeX/PXBtluUkA+ZUoeQ
 M+dYVBHPSuMZWkKDGgKzV7FW0DuVPpemoikqYnJtfIpcTufnjJzihiDg/Ti+5o48U7eW
 QtoaDLqrR5Sza4IIs4m6GFdXoTqRtvplTTk5iWtDaNVYSgAY7LaZK5/IYNI71dKams95
 qwfA==
X-Gm-Message-State: AOAM532FVP0G1HpdMJjVMetSKHpX4J0ZwiwSciUumjsO3rU4/6YyrYZd
 WwgUWFEIcf1CwyOQAyibMjky7EZc/xhZom7XYudGQQ==
X-Google-Smtp-Source: ABdhPJyvbi6MVvka8oPb7oENkUao5IYEFHPUP3rcp9F5m8eqX5HuAA2xZymNtvXrq1hctCuXd2fwUyA6KBl6ff48FYs=
X-Received: by 2002:a0d:e612:0:b0:2fb:103f:4067 with SMTP id
 p18-20020a0de612000000b002fb103f4067mr4331120ywe.151.1651701800743; Wed, 04
 May 2022 15:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220502152524.283374-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20220502152524.283374-1-fabien.dessenne@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 May 2022 00:03:09 +0200
Message-ID: <CACRpkdY7kQ0Fg_9C2kpQug0P=qHrfCu6eu04CugU-e5dO+P4WQ@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: improve debugfs
 information of pinconf-pins entry
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

On Mon, May 2, 2022 at 5:25 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Print the name of the selected alternate function in addition to its
> number. Ex:
>    "pin 135 (PI7): alternate 10 (SAI2_FS_A) - ..."
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
