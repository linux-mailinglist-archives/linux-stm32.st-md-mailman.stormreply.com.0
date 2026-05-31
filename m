Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wElaN5XDG2pAGAkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 07:13:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DFC61489F
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 07:13:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36B1BC8F26D;
	Sun, 31 May 2026 05:13:56 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D70AC87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 05:13:54 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-304cf518c9dso4839756eec.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 May 2026 22:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780204433; x=1780809233;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k3pn4cuUfFSRyvhCaBTSBtnyydB0uD7dBx1ds5nx5l4=;
 b=MTDJTvB0WVfIoHqWJO6KqFpqF1xweHMrr9y8XIdVLUrsSVOGgq8/LR3Odm6xwnNjKf
 6FgxEW3gKrfwK6ZQnvbhaLXMpZ/ZETvuHaqyW3YqzYE212Yq1cV8VJCUvg5GrqaNf/DQ
 HMSmUdWzcEYaxyQB07DeSBlHE/qBifWL43+y7im35rClKtw6/Gd5wjyDJESCvZ0xbgKn
 3InYXjfk0G2oSx8edWRQKACFR1KnggXJ+XL1uH9qqhLuXjPxRMAA5zBZepMnnW2/eeAh
 ndeTSvlK3JcHnsuofYFmt+2QEz9W/dJiSUpg9CvQ5ebAZIeKGuZUWc2F5UI2uXFuDvlL
 uF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780204433; x=1780809233;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k3pn4cuUfFSRyvhCaBTSBtnyydB0uD7dBx1ds5nx5l4=;
 b=sRssLxRB6jHRn/vIgNZHoiV+Wn4zs9L0TY2uxIpYB2/GN21hqlWcTZJvV886u9A8ha
 JV+OJMQtJhQbW+kb3c0+y/V6I23C1DZDK21Nx9PTJ+RxQCJwgFWz3cROBlegzH2j/7di
 +r7pcsMt7u90pcHsIZ1ufkwV5q35/l2q5DaYIqZNLuIsKP/lerSSQ/RThFeSQjSJyinR
 kJpDIaD50V9XPIlqYIJ/oWhNKgLkk0s9XO6dwIgjE+lZBhXcv+0XhLkeL893FFKKSYbd
 wPTeI6CSd4E10zBxKPDeVWBdQoB+NF6IkkoltFsGpOC79wqsbF5pH3hjAARus7MJHOOJ
 z+cw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8EunqOrAk7eaOKK2Daheus5teMpxiryIP03cCIGYtNU32bgvvn+H/Swt8tUJIrH3VunmYvZJMHQS8jVg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0LPKCRugZP82FJ0lgpL8q3wzf6Xi4AjR2t7q0ar7/JOFZpl80
 kqun/FMSfp5NPXuKRSNOY2o3b7KdRQ7NM8xyMuQtpdv6oSfH5srKuV6i
X-Gm-Gg: Acq92OFnURO4DXOuirZzi5fnlL/G6Fi/R7i0AjPrhgiHtC5yBU4ONPEFmKMTRDIcQt7
 8Qi6Z00sXCNUnOguknAIhpiKUk32W9f6bbw6gknU7egxsykpcRxbOSZgFFlcE6eZK1BHZxiKBBz
 U3EHwtIYiu19mOBNp47X1G0p8lS/y6XxKqc8W0j6KZvIcwBWKYlIZvYYCcVqRlNQ51SlvJiYhK4
 xJZ4kSOxkNHSj8DbM+sfPacTj7elVxlyZa+iQ86fINrnnX6WDdiaJJeIn8Ij1XsET1MmAEQlzdL
 YOv7OeIC8C6oZHn1r6rtqwVPMqaiPc3eAggqg80noUZKQinptulN/pgCNvdfKvYk90RRRWfSmCS
 r0R0V9lvl13qgt0spSSTvd/90q3PHo7Lh+EQRpx4nwjQtz9fEnQJIJjW+BnlzuVfMVYV7rU0Kw5
 WGz53cAOdj2u7sWbl4VXypY8uYkckX6EG4qFDzDOGBG2ZB3jvS/iSCeJl+0jv3DRCRyfmmSf4nl
 w==
X-Received: by 2002:a05:693c:300c:b0:2d9:5cd9:b8ff with SMTP id
 5a478bee46e88-304fa4a757dmr2802692eec.6.1780204432587; 
 Sat, 30 May 2026 22:13:52 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:aa7b:13a9:ea74:503])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c3121sm5667940eec.5.2026.05.30.22.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 22:13:51 -0700 (PDT)
Date: Sat, 30 May 2026 22:13:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Message-ID: <ahvDNu0TQKtjvmSk@google.com>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
 <ahp7WuHiPYa7Q_pX@google.com> <ahrP4STTFdUsBp0O@monoceros>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahrP4STTFdUsBp0O@monoceros>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nick Dyer <nick@shmanahar.org>, Kees Cook <kees@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, David Heidelberg <david@ixit.cz>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ingo Molnar <mingo@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Johannes Kirchmair <johannes.kirchmair@skidata.com>,
 Anshul Dalal <anshulusr@gmail.com>, bui duc phuc <phucduc.bui@gmail.com>,
 Thorsten Blum <thorsten.blum@linux.dev>, Josua Mayer <josua@solid-run.com>,
 Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org,
 Jeff LaBundy <jeff@labundy.com>, platform-driver-x86@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Minseong Kim <ii4gsp@gmail.com>, Job Noorman <job@noorman.info>,
 Oleh Kuzhylnyi <kuzhylol@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org,
 Petr Hodina <petr.hodina@protonmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hans de Goede <hansg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v1] Input: Use named initializers for
 arrays of i2c_device_data
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:alexandre.belloni@bootlin.com,m:nick@shmanahar.org,m:kees@kernel.org,m:claudiu.beznea@tuxon.dev,m:david@ixit.cz,m:marco.crivellari@suse.com,m:javier.carrasco@wolfvision.net,m:mingo@kernel.org,m:m.tretter@pengutronix.de,m:andriy.shevchenko@linux.intel.com,m:geert+renesas@glider.be,m:johannes.kirchmair@skidata.com,m:anshulusr@gmail.com,m:phucduc.bui@gmail.com,m:thorsten.blum@linux.dev,m:josua@solid-run.com,m:zhao.xichao@vivo.com,m:linux-input@vger.kernel.org,m:jeff@labundy.com,m:platform-driver-x86@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:sakari.ailus@linux.intel.com,m:michael.hennerich@analog.com,m:ii4gsp@gmail.com,m:job@noorman.info,m:kuzhylol@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:support.opensource@diasemi.com,m:mpenttil@redhat.com,m:y.oudjana@protonmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linusw@kernel.org,m:clamor95@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:nicolas.ferre@microch
 ip.com,m:jekhor@gmail.com,m:linux-kernel@vger.kernel.org,m:petr.hodina@protonmail.com,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:hansg@kernel.org,m:geert@glider.be,m:phucducbui@gmail.com,m:marek.vasut@mailbox.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.091];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,shmanahar.org,kernel.org,tuxon.dev,ixit.cz,suse.com,wolfvision.net,pengutronix.de,linux.intel.com,glider.be,skidata.com,gmail.com,linux.dev,solid-run.com,vivo.com,vger.kernel.org,labundy.com,mailbox.org,analog.com,noorman.info,lists.infradead.org,diasemi.com,redhat.com,protonmail.com,oss.qualcomm.com,st-md-mailman.stormreply.com,microchip.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 78DFC61489F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 02:02:20PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Hello Dmitry,
> =

> On Fri, May 29, 2026 at 10:56:48PM -0700, Dmitry Torokhov wrote:
> > I like the ability to properly set up pointers for driver data, however
> > I do not think we should use named initializers for name field. As long
> > as we are not planning on moving its position I like the brevity of just
> > saying
> > =

> > 	{ "ili210x", .driver_data_ptr =3D &ili210x_chip },
> > =

> > Can we keep the old style for the name field?
> =

> I have no strong opinion here, my patch introduces the named initializer
> for both members for consistency. Note that my patches for all the other
> subsystems (and also other *_device_id) do the same and you're the first
> maintainer with that expressed preference.
> =

> I even sent a few patches that adapt initializers without .driver_data
> (e.g.
> https://lore.kernel.org/all/177932943265.3832404.360063047381979287.git-p=
atchwork-notify@kernel.org/)
> that got positive feedback so far.
> =

> So if you're ok with having input differ in style from (up to now) all
> other subsystems, I can rework the patch.

OK, I guess I am too late to voice my opinion. I do not want to have
different style, in this particular case at least, so I applied the
patch.

Thanks.

-- =

Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
