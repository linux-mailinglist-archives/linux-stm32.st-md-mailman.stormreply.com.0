Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEmfEkIto2me+AQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Feb 2026 19:00:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D45441C5513
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Feb 2026 19:00:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E2F6C030D6;
	Sat, 28 Feb 2026 18:00:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60120C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Feb 2026 18:00:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 10D7142B82;
 Sat, 28 Feb 2026 18:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED299C19423;
 Sat, 28 Feb 2026 17:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772301629;
 bh=kHCRe4FxCpKOmGTFDbEGFmwKc5c1cbzYW9mRrhA/2zM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y5Ww6oOt+Lwkhhw6KzkZzqCLx2GB5Y6V/naeD+g/YVnGDnFJykP4eczgV77pSo6aG
 MwceHNzWz3tTt2nQUPDrqo4OH/XpY1QPEj4j2coQSntozKAfKLK4GkW1a2dH8TyfFX
 5fZRLH0VdmJrHIj0bW/2HmeVqQPjJBYdjnqVErnT7/OV5v8nL9A1bM8hWX1+RqOS8L
 j+1xUXhbGCwz3WIiQx9BfetTOcQFR4X46hu07hQziT4+MpACIMVHSm6kKP/vnmJT2+
 XJSlGPNpWjGSFDy3clti8s912U34ZnWDCJSJbRQ//cNsZce6q9IlsPUYRVrZhQYnRM
 3szaWx8Sycbcw==
Date: Sat, 28 Feb 2026 17:59:54 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20260228175954.1f0950a1@jic23-huawei>
In-Reply-To: <120c7f33-4ca1-4d35-ac1b-b65362f1adfc@baylibre.com>
References: <20260225100421.2366864-1-flavra@baylibre.com>
 <20260225101735.2368252-1-flavra@baylibre.com>
 <120c7f33-4ca1-4d35-ac1b-b65362f1adfc@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Heiko Stuebner <heiko@sntech.de>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Christian Eggers <ceggers@arri.de>, linux-stm32@st-md-mailman.stormreply.com,
 Haibo Chen <haibo.chen@nxp.com>, Lucas Stankus <lucas.p.stankus@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Jorge Marques <jorge.marques@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 Leonard =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 Dixit Parmar <dixitparmar19@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel@vger.kernel.org, Roan van Dijk <roan@protonic.nl>,
 =?UTF-8?B?T25kxZllag==?= Jirman <megi@xff.cz>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Renato Lui Geh <renatogeh@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>, Francesco Lavra <flavra@baylibre.com>,
 linux-doc@vger.kernel.org, Nishant Malpani <nish.malpani25@gmail.com>,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Marius Cristea <marius.cristea@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Lars-Peter Clausen <lars@metafoo.de>, Francesco Dolcini <francesco@dolcini.it>,
 Alex Lanzano <lanzano.alex@gmail.com>, linux-rockchip@lists.infradead.org,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29u?= =?UTF-8?B?w6dhbHZlcw==?=
 <jpaulo.silvagoncalves@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Gustavo Silva <gustavograzs@gmail.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, imx@lists.linux.dev,
 Remi Buisson <remi.buisson@tdk.com>, Dragos Bogdan <dragos.bogdan@analog.com>,
 Frank Li <Frank.Li@nxp.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>, linux-input@vger.kernel.org,
 Kurt Borja <kuurtb@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Tomasz Duszynski <tduszyns@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>, Esteban Blanc <eblanc@baylibre.com>,
 Benson Leung <bleung@chromium.org>,
 Matteo Martelli <matteomartelli3@gmail.com>, Salih Erim <salih.erim@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, Linus Walleij <linusw@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Kent Gustavsson <kent@minoris.se>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Song Qiang <songqiang1304521@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Alisa-Dariana Roman <alisa.roman@analog.com>,
 Puranjay Mohan <puranjay@kernel.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Jagath Jog J <jagathjog1996@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jyoti Bhayana <jbhayana@google.com>, linux-mips@vger.kernel.org,
 linux-iio@vger.kernel.org
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:tgamblin@baylibre.com,m:heiko@sntech.de,m:srinivas.pandruvada@linux.intel.com,m:ceggers@arri.de,m:linux-stm32@st-md-mailman.stormreply.com,m:haibo.chen@nxp.com,m:lucas.p.stankus@gmail.com,m:o.rempel@pengutronix.de,m:jorge.marques@analog.com,m:cosmin.tanislav@analog.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:l.goehrs@pengutronix.de,m:dixitparmar19@gmail.com,m:andy@kernel.org,m:linux-kernel@vger.kernel.org,m:roan@protonic.nl,m:megi@xff.cz,m:Mariel.Tinaco@analog.com,m:kernel@pengutronix.de,m:renatogeh@gmail.com,m:alexandre.belloni@bootlin.com,m:dan@dlrobertson.com,m:flavra@baylibre.com,m:linux-doc@vger.kernel.org,m:nish.malpani25@gmail.com,m:petre.rodan@subdimension.ro,m:marius.cristea@microchip.com,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:lars@metafoo.de,m:francesco@dolcini.it,m:lanzano.alex@gmail.com,m:linux-rockchip@lists.infradead.org,m:jpaulo.silvagoncalves@gmail.com,m:jean-baptiste.maneyrol@tdk.com
 ,m:Michael.Hennerich@analog.com,m:mazziesaccount@gmail.com,m:gustavograzs@gmail.com,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:imx@lists.linux.dev,m:remi.buisson@tdk.com,m:dragos.bogdan@analog.com,m:Frank.Li@nxp.com,m:nuno.sa@analog.com,m:festevam@gmail.com,m:marcus.folkesson@gmail.com,m:corbet@lwn.net,m:javier.carrasco.cruz@gmail.com,m:ramona.gradinariu@analog.com,m:linux-input@vger.kernel.org,m:kuurtb@gmail.com,m:lorenzo@kernel.org,m:tduszyns@gmail.com,m:jikos@kernel.org,m:eugen.hristev@linaro.org,m:eblanc@baylibre.com,m:bleung@chromium.org,m:matteomartelli3@gmail.com,m:salih.erim@amd.com,m:conall.ogriofa@amd.com,m:linusw@kernel.org,m:claudiu.beznea@tuxon.dev,m:kent@minoris.se,m:sergiu.cuciurean@analog.com,m:nicolas.ferre@microchip.com,m:paul@crapouillou.net,m:antoniu.miclaus@analog.com,m:songqiang1304521@gmail.com,m:marcelo.schmitt@analog.com,m:alisa.roman@analog.com,m:puranjay@kernel.org,m:gerald.loacker@wolfvision.net,m:jagathjog
 1996@gmail.com,m:rmfrfs@gmail.com,m:muditsharma.info@gmail.com,m:linux-mediatek@lists.infradead.org,m:ak@it-klinger.de,m:matthias.bgg@gmail.com,m:ramona.bolboaca@analog.com,m:angelogioacchino.delregno@collabora.com,m:jbhayana@google.com,m:linux-mips@vger.kernel.org,m:linux-iio@vger.kernel.org,m:lucaspstankus@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[87];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[baylibre.com,sntech.de,linux.intel.com,arri.de,st-md-mailman.stormreply.com,nxp.com,gmail.com,pengutronix.de,analog.com,linuxfoundation.org,kernel.org,vger.kernel.org,protonic.nl,xff.cz,bootlin.com,dlrobertson.com,subdimension.ro,microchip.com,chromium.org,lists.linux.dev,metafoo.de,dolcini.it,lists.infradead.org,tdk.com,amd.com,lwn.net,linaro.org,tuxon.dev,minoris.se,crapouillou.net,wolfvision.net,it-klinger.de,collabora.com,google.com];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: D45441C5513
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 15:27:01 -0600
David Lechner <dlechner@baylibre.com> wrote:

> On 2/25/26 4:17 AM, Francesco Lavra wrote:
> > This field is used to differentiate between signed and unsigned integers.
> > A following commit will extend its use to in order to add support for non-
> > integer scan elements; therefore, change its name from 'sign' to a more
> > generic 'format'.
> >   
> 
> Maybe Jonathan is OK with doing this all at once, but another alternative
> could be to introduce a union to allow both names at the same time, then
> we could make the change more gradually.

Please do the union for v7.  Not so much because I mind a global change, but
more because the chances of merge conflicts are too high.

Perhaps for this series just introduce the union and use it in the driver
here. We can then chase it through the rest of the tree as a separate step.

Alternatively leave it with a misleading name for now (so allow 'f' to be a
magic sign value) and we can do the rename as a follow up.

Jonathan


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
