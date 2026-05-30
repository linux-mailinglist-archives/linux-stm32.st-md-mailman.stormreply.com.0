Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qChMKSp8GmrW4ggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 30 May 2026 07:56:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33F60B617
	for <lists+linux-stm32@lfdr.de>; Sat, 30 May 2026 07:56:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DE27C8F26A;
	Sat, 30 May 2026 05:56:57 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F280C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 May 2026 05:56:54 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-304ec41197bso1374075eec.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 22:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780120613; x=1780725413;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uR8xbGosrZDiZ3bGOF/uomoehMbPSntRHGsC0W465dY=;
 b=c7COhUbe2HWnrhVOE+BNAHbgZ8kS3g079ZNqEw3H2xtGbQ23rBf0Esu9ZnTu2/rNTI
 /DHC7Fb8TNqUKHY5qt2/zJb6mVsdqvF+upuE9obJHMegLq0X2sGQMLhLcnYZ+U+4ehqQ
 3pXuumkeZ6mZSof0DAEOErRM0ijpBAPsTppIToAZl8Kezu2XayEc28G8a3rk/CP5XQ8K
 n4iBuxFs9Bq8r59wfc0GpHJGUMbtxGlWANRQLTAuKb2y5bDPkn9yfbpTylfeYYE2pRst
 M+jcsHoJg23GtQitoMk+Ra/TQZQQjBJuMRcbqFqy4S6v2iaMsRLX4etR8FIuM45S/gbW
 GKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780120613; x=1780725413;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uR8xbGosrZDiZ3bGOF/uomoehMbPSntRHGsC0W465dY=;
 b=aFNTrJUXhMwFqIQfjOJANbtW2V9Ba5DJnYMg0rC5FidEqtBrch+4GVI3I0Ik1aMYf5
 nd3Ma9ts+NAQ6pzANauQBKhxz9KThgsS9XySBNDdZBgTvZEjMEwl1bvyAtfKBR1IyiLc
 jUZmDruOLuvq7hdTo52bV2PViTnY5h1pbwg5le5ImdblgcGnFVgnsMV9kk9YXaXNeNWN
 /iJKVHZynz4ELOMsJ9rs3mNVWSBGu2DwJ+xcSlCvHQkGzLKAGCq3htFfcfZfYfRLcnwW
 qb2AGfuC2qitmVmRiOVfhus+FtZ1FJ1MV4+on/8Hty9amScXHXD9HtmIYZxN7hPQFjpM
 oltA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8lBUa5E3yjbM5NrcpwSR93xEwd+0Dbw4aPxamKAJ0zrGxnkEevSNiiIkK4T6sP5VNVbf3BsQfX2Strcw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6SLgKKYLYYEPpVspbZhEDrH5kWYaa8J0PDieoizCoPtW9PsWL
 pbnbPGccyNBSe1A21VuKnIhOlu7zTz00ekwioI46xHslJ/+/i5VFQrRW
X-Gm-Gg: Acq92OEFY5YgpaCQWGQUdXmMbxaij9wJloa4zW3pRJT03dXZYtUZpQQoszIbA+I1tDe
 cVcoVEVbl6VhjcpSkOfLMZI3+dL8wKfNa7vWSjK0ugMz+GjCC4rQa13thhBYiKQNpo3eal1JdFb
 rRSCEMYsnkT8169YfPM4D5tQdMhQwuBE4lBBlOrNlQHmfo+J5rXEwUj37KrlbnUpZ25bYvMdrV6
 qMb0cwHb6I1mQCJEbAWpeyRCOy7kCOXIpM+QA3hx6wfY/LPY3AwdAoxClrzKSndz4LFkCc196dm
 UIinc0P4rxoiWHyu1b4zLbQwT+i9tVq/abkMBVCheevOZ7lbEcucXKQCvp7pIqoT0G0D9ZN3Rp+
 dOCK8s0ooO5bODn15hTnGVE9pImKuLuBHNY7ZvHgBQZc8wQZXHNihiEjVN8JAPjF2ZohsQ14FR+
 WMzGW2kkQO/uWAEZGMDLGC8EXlGcnIzhsvQy4al+dKKO5ZW5E2i55VJuEUcAdlrojMAL12ZyF0C
 q4=
X-Received: by 2002:a05:7300:80c9:b0:2e0:1f09:d924 with SMTP id
 5a478bee46e88-304fa526036mr1388786eec.5.1780120613171; 
 Fri, 29 May 2026 22:56:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:307d:2a52:8823:4a01])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed53f002sm3397737eec.18.2026.05.29.22.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 22:56:52 -0700 (PDT)
Date: Fri, 29 May 2026 22:56:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Message-ID: <ahp7WuHiPYa7Q_pX@google.com>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
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
	NEURAL_HAM(-0.00)[-0.846];
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
X-Rspamd-Queue-Id: 3E33F60B617
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Uwe,

On Fri, May 15, 2026 at 06:48:47PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> =

> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> =

> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> =

> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
> =

> the mentioned change to i2c_device_id is the following:
> =

> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicet=
able.h
> 	index 23ff24080dfd..aebd3a5e90af 100644
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> 	=

> 	 struct i2c_device_id {
> 	 	char name[I2C_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;     /* Data private to the driver */
> 	+	union {
> 	+		/* Data private to the driver */
> 	+		kernel_ulong_t driver_data;
> 	+		const void *driver_data_ptr;
> 	+	};
> 	 };
> 	=

> 	 /* pci_epf */
> =

> and this requires that .driver_data is assigned via a named initializer
> for static data. This requirement isn't a bad one because named
> initializers are also much better readable than list initializers.
> =

> The union added to struct i2c_device_id enables further cleanups like:
> =

> 	diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchsc=
reen/ili210x.c
> 	index 66ada7ffbc80..94aa4dc002c5 100644
> 	--- a/drivers/input/touchscreen/ili210x.c
> 	+++ b/drivers/input/touchscreen/ili210x.c
> 	@@ -969,7 +969,7 @@ static int ili210x_i2c_probe(struct i2c_client *clie=
nt)
> 	 =

> 		chip =3D device_get_match_data(dev);
> 		if (!chip && id)
> 	-		chip =3D (const struct ili2xxx_chip *)id->driver_data;
> 	+		chip =3D id->driver_data_ptr;
> 		if (!chip)
> 			return dev_err_probe(&client->dev, -ENODEV, "unknown device model\n");
> 	 =

> 	@@ -1049,10 +1049,10 @@ static int ili210x_i2c_probe(struct i2c_client *=
client)
> 	 }
> 	 =

> 	 static const struct i2c_device_id ili210x_i2c_id[] =3D {
> 	-	{ .name =3D "ili210x", .driver_data =3D (long)&ili210x_chip },
> 	-	{ .name =3D "ili2117", .driver_data =3D (long)&ili211x_chip },
> 	-	{ .name =3D "ili2120", .driver_data =3D (long)&ili212x_chip },
> 	-	{ .name =3D "ili251x", .driver_data =3D (long)&ili251x_chip },
> 	+	{ .name =3D "ili210x", .driver_data_ptr =3D &ili210x_chip },
> 	+	{ .name =3D "ili2117", .driver_data_ptr =3D &ili211x_chip },
> 	+	{ .name =3D "ili2120", .driver_data_ptr =3D &ili212x_chip },
> 	+	{ .name =3D "ili251x", .driver_data_ptr =3D &ili251x_chip },
> 		{ }
> 	 };
> 	 MODULE_DEVICE_TABLE(i2c, ili210x_i2c_id);
> =

> that are an improvement for readability (again!) and it keeps some
> properties of the pointers (here: being const) without having to pay
> attention for that.
> =

> My additional motivation for this effort is CHERI[1]. This is a hardware
> extension that uses 128 bit pointers but unsigned long is still 64 bit.
> So with CHERI you cannot store pointers in unsigned long variables.

I like the ability to properly set up pointers for driver data, however
I do not think we should use named initializers for name field. As long
as we are not planning on moving its position I like the brevity of just
saying

	{ "ili210x", .driver_data_ptr =3D &ili210x_chip },

Can we keep the old style for the name field?

Thanks.

-- =

Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
