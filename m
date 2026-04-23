Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDCLKrSG72kECQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BE5475A86
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5280DC7A836;
	Mon, 27 Apr 2026 15:54:28 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54211C8F26B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2026 20:55:35 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-479e4835e08so2700031b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2026 13:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776977734; x=1777582534;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3vKiM6M0LduO2D2FArnWSoF3Wdb1YcJsf91FDSRy54M=;
 b=qle9OWiugp3DLcQuIQjiA5jKrfcfSL6hX5GaB21Vb+lTU5zHoNKYVhUdJit9LeIreH
 QnGsgvSHNO6qlZx2/hGjFNnp3FFEQQcNeqOexTepZBZkfRamwC80eoX914YokTuxnL2M
 iRe2+MOJFkoRKFJmygFTX7zJgWJHd9+YaPMwx3W01O3DGx+Dc4HDxBJBz1nyylww48FA
 9K9TMqCLWjVxLNNNuk7/ztj1n3YfnlSMmKsPN3H2iw9hiSn2Ko3Hm4OiOp6EMjN/TI0B
 g67T4YMjtspHuU28wH35TWUDVOAk01EAQVLXgGgoeEii5r5mUpx1hfWkYJJOvxVj2Hfc
 e6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776977734; x=1777582534;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3vKiM6M0LduO2D2FArnWSoF3Wdb1YcJsf91FDSRy54M=;
 b=aMC/8+y6ly3yo5TURCgv1ahuZqePW74tm+7fUmZs/gp3iwJ6X8lm/c+kxY4Uzzvwky
 K5n7U/k7k1IG4ZMGBmBR6jky2KvsRjZtDYVHdPhbY6386zX5fE0jdkynrTDUvXq8BG+e
 YZvGI600FZr3r26dDyji3/Fym7KpTMfgsDpFkdXyAGOUurP8+tTHwdwNLrhW5MHzsfGu
 R4c5lC0yri57snhCG/v2SPlP3SyyJNNYgbT1inNn9cN/jo7hNohYI7Mw5BXKn7TgMH8H
 ZrCBlHf/ozHfPony/Ow1+KhE4l7m2jkLyA6bI/D2G0eNQomQE6JWfJN4+jJtc+/RcrWr
 xjFw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Ij1WTiYat5JhEuLLIIbIWMnpSVE4bltrL+jOeBrGnRecivFzvfSTqInwYxe2xv6CxvFPX+qT0TbAFVg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzu0xc3Bd57lWpqah34cfj1vKxBPmfFyI2g/EHlSyTSYk/XdKWH
 JxO3QAeXbZQK3TcDwwegbKbR0mZB/0enXg7jPPzoXf2nuKVvKLJGE75F
X-Gm-Gg: AeBDievL/vFk5+plTmRxVJ391BicXscCjvs79EITsla+hxWksimUWemODfKiZ1WE2DB
 E5a34JHnOxDksCCseWcnyKkGVp8BAjUwZcS4y4Dk0Kp4YJ9QdT5MTGpEnUzwFDaolBlZigATnR8
 reuME5bryzW21DFtQyHAjVG9SLIuXQkOTURm6lpHJew/4i2yu3kU5NbMGSatrrSBsWcAVI/65BC
 Mqkl4BZyut37Ys3xt4AJizOhg885oy5NxlIDwKiA1z0ezko03E+jQjovdyIL4bWuZDrd6ReHCMq
 HmNFeYmTAVQQhWyEXLlWHUVlf8KwY2OmOqNmSFRoIq5VP3UH+ocyThorC8brR0pPnE6+jUO57pV
 D8E+ygPxC6KFCJctLbtQIFMOpnV5D3Ww1mzwIOw4UvftmFqVOxdsePtTBbTq6pEW1WLt56jVsOV
 y3sNEFy3h+So0CHLFxhvKLwIZa/j8olt1TsA8PZH7cjytAFQ6y2y7B033p9QOp2CeBjgjD3h8j
X-Received: by 2002:a05:6808:4fde:b0:450:b249:718c with SMTP id
 5614622812f47-4799c9b1d47mr15957275b6e.31.1776977734043; 
 Thu, 23 Apr 2026 13:55:34 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net.
 [98.38.17.99]) by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4799fead505sm14329744b6e.2.2026.04.23.13.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 13:55:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Thu, 23 Apr 2026 14:53:59 -0600
MIME-Version: 1.0
Message-Id: <20260423-submit-dyndbg-classmap-foundation-v14-18-2b809a8019d0@gmail.com>
References: <20260423-submit-dyndbg-classmap-foundation-v14-0-2b809a8019d0@gmail.com>
In-Reply-To: <20260423-submit-dyndbg-classmap-foundation-v14-0-2b809a8019d0@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Jason Baron <jbaron@akamai.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Sean Paul <sean@poorly.run>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Ruben Wauters <rubenru09@aol.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Liu Ying <victor.liu@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Paul Kocialkowski <paulk@sys-base.io>, 
 Jianmin Lv <lvjianmin@loongson.cn>, Qianhai Wu <wuqianhai@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>, Mingcong Bai <jeffbai@aosc.io>, 
 Xi Ruoyao <xry111@xry111.site>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776977637; l=3514;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=P80ziZ2kI8Whec+Ezljf/adgRZa3L0Pl7Cz8Qw7ESms=;
 b=7oS4PFpYNT5pkPe9d/6jwN43zQHFV3ZXzzfVE07BNgChvucdZ7oiVyCLTrH106ZHb57COsib2
 B/3Yn5wyYFSCbRR97h48IYVVpZDIxR8JbgltPz1aU89lbht6s0tUqdS
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: imx@lists.linux.dev, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arch@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, spice-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-mediatek@lists.infradead.org, intel-xe@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-modules@vger.kernel.org
Subject: [Linux-stm32] [PATCH v14 18/92] dyndbg: macrofy a 2-index for-loop
	pattern
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
X-Rspamd-Queue-Id: 90BE5475A86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[91];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:jbaron@akamai.com,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:gregkh@linuxfoundation.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@redhat.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:dakr@kernel.org,m:patrik.r.jakobsson@gmail.com,m:zack.rusin@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:sean@poorly.run,m:jfal
 empe@redhat.com,m:rubenru09@aol.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:xinliang.liu@linaro.org,m:tiantao6@hisilicon.com,m:kong.kongxinwei@hisilicon.com,m:sumit.semwal@linaro.org,m:yongqin.liu@linaro.org,m:jstultz@google.com,m:p.zabel@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:chunkuang.hu@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:karol.wachowski@linux.intel.com,m:robh@kernel.org,m:tomeu@
 tomeuvizoso.net,m:liviu.dudau@arm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:victor.liu@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:l.stach@pengutronix.de,m:paulk@sys-base.io,m:lvjianmin@loongson.cn,m:wuqianhai@loongson.cn,m:chenhuacai@kernel.org,m:jeffbai@aosc.io,m:xry111@xry111.site,m:zhengxingda@iscas.ac.cn,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[arndb.de,akamai.com,kernel.org,suse.com,google.com,atomlin.com,linux-foundation.org,lwn.net,linuxfoundation.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,amd.com,redhat.com,collabora.com,chromium.org,broadcom.com,bootlin.com,poorly.run,aol.com,raspberrypi.com,igalia.com,oss.qualcomm.com,linux.dev,somainline.org,linaro.org,hisilicon.com,pengutronix.de,nxp.com,rock-chips.com,sntech.de,foss.st.com,tomeuvizoso.net,arm.com,ideasonboard.com,kwiboo.se,oss.nxp.com,sys-base.io,loongson.cn,aosc.io,xry111.site,iscas.ac.cn,glider.be,armlinux.org.uk];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[129];
	NEURAL_HAM(-0.00)[-0.887];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.freedesktop.org,st-md-mailman.stormreply.com,lists.infradead.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,etnaviv];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]

dynamic-debug currently has 2 __sections (__dyndbg, __dyndb_classes),
struct _ddebug_info keeps track of them both, with 2 members each:
_vec and _vec#_len.

We need to loop over these sections, with index and record pointer,
making ref to both _vec and _vec_len.  This is already fiddly and
error-prone, and will get worse as we add a 3rd section.

Lets instead embed/abstract the fiddly-ness in the `for_subvec()`
macro, and avoid repeating it going forward.

This is a for-loop macro expander, so it syntactically expects to
precede either a single statement or a { block } of them, and the
usual typeof or do-while-0 tricks are unavailable to fix the
multiple-expansion warning.

The macro needs a lot from its caller: it needs 2 local vars, 1 of
which is a ref to a contained struct with named members.  To support
these requirements, add:

1. __ASSERT_IS_LVALUE(_X):
   ie: ((void)sizeof((void)0, &(x)))

2. __ASSERT_HAS_VEC_MEMBERS(_X, _Y):
   compile-time check that the _Y "vector" exists
   ie: _X->_Y and _X->num_##_Y are lvalues.

The for_subvec() macro then invokes these in the initialization of the
for-loop; they disappear at runtime.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 94a66c8537ab..8f614eba8ace 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -129,6 +129,28 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a member in @_box
+ */
+#define __ASSERT_IS_LVALUE(x) ((void)sizeof((void)0, &(x)))
+#define __ASSERT_HAS_VEC_MEMBER(_box, _vec) \
+	(void)sizeof((_box)->_vec + (_box)->num_##_vec)
+
+#define for_subvec(_i, _sp, _box, _vec)			\
+	for (__ASSERT_IS_LVALUE(_i),			\
+		__ASSERT_IS_LVALUE(_sp),		\
+		__ASSERT_HAS_VEC_MEMBER(_box, _vec),	\
+		(_i) = 0,				\
+		(_sp) = (_box)->_vec;			\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)		/* { block } */
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -156,7 +178,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1232,8 +1254,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",

-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
