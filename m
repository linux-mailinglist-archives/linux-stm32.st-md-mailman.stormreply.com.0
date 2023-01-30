Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42850681560
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jan 2023 16:45:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E383FC6506E;
	Mon, 30 Jan 2023 15:45:08 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA8A6C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 15:45:06 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id hx15so13417384ejc.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 07:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HPKfZ1FiVPXA8mxWW+VlALwncASGT70c5IKSFv8vcp4=;
 b=nXk99Juo2mzL5FtOV2x0t3TnMs25UyawxejJYdvMelHJhBfp8KEnWRsFpCIVMW83Ah
 Fc/RoUy+z38DLgL9IJDhFIxIsB6NgeOou4kHjBtJa4yS7GZV2bM5mp8dnKLpsUOWOXxp
 GIpSK5Ig+L+XVzKJuCisZpYs5nzAnM+ZN5uz/VKFenaCCgXSMHFO/znewkjGARNJ8pVK
 qeJ1LhBsq2qXynoC6GylHg6h0FCzWo/eynwDkOr1dtaGFQQZzE5jsYJYrLALJJigpdO1
 Po4R5awWvA9hUEPI2mqjDO45/h2+cNtrj1DE/DZtWiFSbBpYo1Dd3yCfKasbr8rIOxZu
 JqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HPKfZ1FiVPXA8mxWW+VlALwncASGT70c5IKSFv8vcp4=;
 b=SAISE95uTLMNBEhTkoTxxHRwDbrxey7+jjuAA0XqPVzoSTFEuQfc+YMhSaoThdMSu9
 1pRRzFV1Qo/NePpsSIP+zGfa2Wo3lhmV+2iDviVHiI5ADGt+a+0IL898L676eZqKH4yy
 T2xJUql7UNk7tiywjfVSSoHgpCyOC5J0h8jrpBKHmty3ktR4ZvmtF2CffiRlKNULWMDr
 wxS9BFbtvcuytWaeIkh9c0Tdy3ALzcAA8osBKkigRln2Hl94aRsGg4vOSvU6oNpPWt8o
 cWt1GAacJLxytYK2puMljYVS8uq/8gThxVQjt3q5oGAACJ7UBZsk7k/sYcWXqpfo+z6e
 511A==
X-Gm-Message-State: AO0yUKWeFxB6fuH46x1z5z8kYh2a9CgemPrcP4UxvnR6CrhKqZpXvOj0
 ZtuPL2/QLNB6eO0XIEZB7Fg=
X-Google-Smtp-Source: AK7set9DF8ufsPfZTTZm6/e1sCFb3FHJ60JMJa9iaMtFSHRgetnOK9UOHule9/s3mYx2Jl6/lsdhvQ==
X-Received: by 2002:a17:906:4912:b0:878:4e83:b058 with SMTP id
 b18-20020a170906491200b008784e83b058mr18296813ejq.1.1675093506380; 
 Mon, 30 Jan 2023 07:45:06 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 j15-20020aa7c40f000000b0049f88f00f70sm5619884edq.7.2023.01.30.07.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 07:45:05 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 u.kleine-koenig@pengutronix.de
Date: Mon, 30 Jan 2023 16:45:04 +0100
Message-Id: <167509347310.581147.17334972892537481751.b4-ty@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20221123133652.465724-1-fabrice.gasnier@foss.st.com>
References: <20221123133652.465724-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32-lp: fix the check on arr and
	cmp registers update
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

On Wed, 23 Nov 2022 14:36:52 +0100, Fabrice Gasnier wrote:
> The ARR (auto reload register) and CMP (compare) registers are
> successively written. The status bits to check the update of these
> registers are polled together with regmap_read_poll_timeout().
> The condition to end the loop may become true, even if one of the
> register isn't correctly updated.
> So ensure both status bits are set before clearing them.
> 
> [...]

Applied, thanks!

[1/1] pwm: stm32-lp: fix the check on arr and cmp registers update
      commit: 3066bc2d58be31275afb51a589668f265e419c37

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
