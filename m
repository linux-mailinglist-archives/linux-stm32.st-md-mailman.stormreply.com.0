Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMLEHSxpn2lRagQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 22:27:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1386519DD11
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 22:27:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5CE2C87EC4;
	Wed, 25 Feb 2026 21:27:07 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74CF2C87EC2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 21:27:06 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7d4ba9abbecso60146a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 13:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772054825; x=1772659625;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6qd3od5gT9Y56WsM6DlqnASWYdZTTGBmXPSgA7J3iS4=;
 b=aP4zlLfsxSTUTUsUgOaQ6iVX8QQO3MJho5GroLHCadsWEmCGMQOkRW0OPKtumfVjIC
 1lflqT0/MolWd2OHWEAkjNl/CMe8miDcA5+Snq/KPfWwF38VkpVJ8IU3TAZ3kZIav4kI
 bAQvbX9bemnBcmdRLSLlWHT6VdcH/Z5+hNJ4dvTwWvFIhEzQ/FISCR8FIaztZXj3eJ7N
 gChVGZtL7e06wF3KEIVPejosZ+c5qpRzD7ZhZC6CJqG/hSVhgBl9xlfWQ5tMJcwu0uOP
 M5miV+VHC2CVhqAnYknOu8JrRB/D6m+873olXpQldwoLipuooCUVqV4WWMMh7BSgJ37p
 hKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772054825; x=1772659625;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6qd3od5gT9Y56WsM6DlqnASWYdZTTGBmXPSgA7J3iS4=;
 b=b2e0BQSU+eBK3fbaaebqUdtQNZpjnHsMFR/nYvajphoiMnBU6NB1RNDvFXeCyL98Qq
 KChEmQ/z5/MbNvEMrmSQZf+4Nsh7f/5KIr6vxJjn94JcrcV/KR8ujxhasKZmazz8b/IZ
 8bSHY8WnTAyLy03P7tlNbx+Xx+85wetYpS/QcbncOxRcPgjJjEMOiD24kNw8SEb7R0Hz
 EmEBWMOtILZgAXhUlF5lkUHDYcPf55L1d8nDhdjUXctARJPFDebMvLialKyIjGtYGTG/
 RJ3Lml0v9nu2Gin3Y4xL88Fd5LOLrn9OfJPeX835LxIpVbHYLqt+tJo7drNiMKCVHOZ0
 sh6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Iim5R8c7fwmuvZ5RWLY891klyREmgQZ9BkaUSFyWIGRh0E1L+/I3jSopWcj7u8JEPax6lQjG3prVDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzCp8cPJVGu1AVVWcZh7U5usdvxYTZpycAIWcYfdAEd2/8iD+FR
 romjhGXEZEPmmUrdXqPitely/eaoPEMlMV3pPStPDgEhptbXa8Gbt37frIv+R+OFdqE=
X-Gm-Gg: ATEYQzywzexcfKRURDLd3ZpjcRyzs7JAiKponifzIwjJVPNSb0IRMPlXmNk7z/NLf3I
 2CK3N07N/h9BU9klo7wq1llAXDpYJk40fdPHGnmsnZS6WXHvk+pxhZN4QrOmEtP49V4zDez/3CP
 zKwdPBd35k8xpJRoYAKF6dTMTUB+DJFF8s0Wwnf9dYCkYumf2sMHuLJhrpm2C4Cne/gh37aDqPD
 jZcSBn4Z9zUwadnC+EzWTk397Q+mtTLFKxs5lw9d/ct2YeGZDAsJVQdN6/7+Hd1BmEc+Vl0KV6K
 ZnKBW61srQzNGspkuucNLCfj5GCVSXA66kvYam0VE3YGqgAQA+55p/leC0aXjEfeONnK7Xs3uTm
 wSqDJEUGz+bCJHH2TuhXLz9yaKRJAizpZgvYNqJPkQVsLltdeQ0mDECY/uI+jPB0ZQXYY48qwzc
 Cv4cjLAqJcPn/T0T73bEZ9G5Oa1x46LpkXDpiYYbZcr3fXA3MjqXSRHgR+ckkQ0uQrEA3q3HU=
X-Received: by 2002:a05:6870:2188:b0:3e8:8e56:671a with SMTP id
 586e51a60fabf-4157b210230mr8655778fac.54.1772054824819; 
 Wed, 25 Feb 2026 13:27:04 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:146:def2:caeb:cb1f?
 ([2600:8803:e7e4:500:146:def2:caeb:cb1f])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4160cf2572bsm64198fac.2.2026.02.25.13.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 13:27:04 -0800 (PST)
Message-ID: <120c7f33-4ca1-4d35-ac1b-b65362f1adfc@baylibre.com>
Date: Wed, 25 Feb 2026 15:27:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francesco Lavra <flavra@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Dan Robertson <dan@dlrobertson.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Esteban Blanc <eblanc@baylibre.com>, Jorge Marques
 <jorge.marques@analog.com>, Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Alisa-Dariana Roman <alisa.roman@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, Renato Lui Geh
 <renatogeh@gmail.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andreas Klinger
 <ak@it-klinger.de>, Paul Cercueil <paul@crapouillou.net>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Marius Cristea <marius.cristea@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Kurt Borja <kuurtb@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, =?UTF-8?Q?Leonard_G=C3=B6hrs?=
 <l.goehrs@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Haibo Chen <haibo.chen@nxp.com>, Salih Erim <salih.erim@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, Michal Simek
 <michal.simek@amd.com>, Gustavo Silva <gustavograzs@gmail.com>,
 Tomasz Duszynski <tduszyns@gmail.com>, Roan van Dijk <roan@protonic.nl>,
 Jyoti Bhayana <jbhayana@google.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Nishant Malpani <nish.malpani25@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Alex Lanzano
 <lanzano.alex@gmail.com>, Jagath Jog J <jagathjog1996@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Remi Buisson <remi.buisson@tdk.com>, Christian Eggers <ceggers@arri.de>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, =?UTF-8?Q?Ond=C5=99ej_Jir?=
 =?UTF-8?Q?man?= <megi@xff.cz>, Song Qiang <songqiang1304521@gmail.com>,
 Dixit Parmar <dixitparmar19@gmail.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260225100421.2366864-1-flavra@baylibre.com>
 <20260225101735.2368252-1-flavra@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260225101735.2368252-1-flavra@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v6 4/7] iio: Rename 'sign' field to
 `format` in struct iio_scan_type
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[baylibre.com,lwn.net,linuxfoundation.org,metafoo.de,analog.com,gmail.com,kernel.org,subdimension.ro,dlrobertson.com,chromium.org,linux.intel.com,linaro.org,microchip.com,bootlin.com,tuxon.dev,it-klinger.de,crapouillou.net,minoris.se,collabora.com,nxp.com,pengutronix.de,sntech.de,foss.st.com,dolcini.it,amd.com,protonic.nl,google.com,tdk.com,arri.de,xff.cz,wolfvision.net,vger.kernel.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:flavra@baylibre.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:lucas.p.stankus@gmail.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:puranjay@kernel.org,m:cosmin.tanislav@analog.com,m:ramona.gradinariu@analog.com,m:antoniu.miclaus@analog.com,m:petre.rodan@subdimension.ro,m:dan@dlrobertson.com,m:bleung@chromium.org,m:groeck@chromium.org,m:jikos@kernel.org,m:srinivas.pandruvada@linux.intel.com,m:mazziesaccount@gmail.com,m:marcelo.schmitt@analog.com,m:eblanc@baylibre.com,m:jorge.marques@analog.com,m:sergiu.cuciurean@analog.com,m:dragos.bogdan@analog.com,m:alisa.roman@analog.com,m:tgamblin@baylibre.com,m:renatogeh@gmail.com,m:eugen.hristev@linaro.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:ak@it-klinger.de,m:paul@crapouillou.net,m:ramona.bolboaca@analog.com,m:marcus.folkesson@gmail.com,m:kent@minoris.se,m:matthias.bgg@gmail.com,m:angelogioacch
 ino.delregno@collabora.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matteomartelli3@gmail.com,m:marius.cristea@microchip.com,m:heiko@sntech.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:kuurtb@gmail.com,m:francesco@dolcini.it,m:jpaulo.silvagoncalves@gmail.com,m:l.goehrs@pengutronix.de,m:o.rempel@pengutronix.de,m:haibo.chen@nxp.com,m:salih.erim@amd.com,m:conall.ogriofa@amd.com,m:michal.simek@amd.com,m:gustavograzs@gmail.com,m:tduszyns@gmail.com,m:roan@protonic.nl,m:jbhayana@google.com,m:Mariel.Tinaco@analog.com,m:nish.malpani25@gmail.com,m:rmfrfs@gmail.com,m:linusw@kernel.org,m:lorenzo@kernel.org,m:lanzano.alex@gmail.com,m:jagathjog1996@gmail.com,m:jean-baptiste.maneyrol@tdk.com,m:remi.buisson@tdk.com,m:ceggers@arri.de,m:muditsharma.info@gmail.com,m:javier.carrasco.cruz@gmail.com,m:megi@xff.cz,m:songqiang1304521@gmail.com,m:dixitparmar19@gmail.com,m:gerald.loacker@wolfvision.net,m:linux-doc@vger.kernel.org,m:linux-ke
 rnel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:linux-input@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:imx@lists.linux.dev,m:linux-rockchip@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:lucaspstankus@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[88];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.888];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 1386519DD11
X-Rspamd-Action: no action

On 2/25/26 4:17 AM, Francesco Lavra wrote:
> This field is used to differentiate between signed and unsigned integers.
> A following commit will extend its use to in order to add support for non-
> integer scan elements; therefore, change its name from 'sign' to a more
> generic 'format'.
> 

Maybe Jonathan is OK with doing this all at once, but another alternative
could be to introduce a union to allow both names at the same time, then
we could make the change more gradually.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
