Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD0AAC0F8F
	for <lists+linux-stm32@lfdr.de>; Thu, 22 May 2025 17:12:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AA81C7A826;
	Thu, 22 May 2025 15:12:05 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71009C7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 15:12:03 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6f8b47c5482so99783946d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 08:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747926722; x=1748531522;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zBpkT+X12qTj4ZXFWwDHYvuVR5JkpgqcjljjqtTRTxw=;
 b=C8KcUO8APr5AicIQo3zBHlqutYr0r4TwqYOzzDAwy5bVGaZ5sQOO/mpE7wUGDtzXOH
 xYDQxbF/Uk+YIY8hJrsloh8E1qRcMlLM+CQ/l7AAmlUCWtxHp7vvyyCF+nbxcKTaKAkm
 uIGHv7vFnTzkSjc/IGwc5YcIm1dm08JkHYEqjU8tHtCkwNrL4pqZJVndZp3uqyQKDRB/
 y5ZEgNySvXAXK4wROG8U1/cJa/rez4g7W1vSUZvSwQDKOIMZXJw/35FlelfAEjLBMx+u
 ItlIfQKvAhpN/iQYhepA9s7z7UWYtRAiEpvpUBUypr9ruct6T/RDpSxeteVEuRzOZ0Q4
 n8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747926722; x=1748531522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zBpkT+X12qTj4ZXFWwDHYvuVR5JkpgqcjljjqtTRTxw=;
 b=TK7cHd/MCz7+GbtJCiTEgEkK5wuCOW9kQ1CFn+hiexEylEf2/dcuuKKEMrD1fviDKi
 Cc9sOUD9TLxSlbIrSCJk0O2xVnWtLEOQgM0TbaJ001S5mcZqF76PmJQM/RVqFbD1MBia
 IEtr9NljlySLr+cRBctM7dy/7N1qwF25HFyjQO1aS4JXRURfrHY7KGVACg8lqnE4SdIv
 ZuWVHOTmp4/jA2KbzmJr2T0EcZffGVEBKkbkdDTIcm66EyB6rpOHWzfwCWb3m/qB5Td2
 k9N6INBdTcWi8JJ/9kWu/TwyO7YFPiNZppL7hp4tJvyCrjv2BNTO/sMQHfLqTcXyxYju
 e9MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAGhv+aDZ5RjWE9gfFr/+NAOCTqUzg0BBsvseo/ISjfiWOzbI+FNBCDbuCwDMpCcyC9n0hI7gYmfMm1Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxHS6iCcXt4sgnveCvCpk/Jh5yRwFmtx0X3K6+Ek6ZZ+O92vZ4m
 LhIx1+QSsn/aFnIxG/3O7PBnzoQ1v8JzQZlvkztFJEo6piJGVDEJk6igp5oMYW/8f0DKOwzCwOT
 Q97suZI9MJzcw4IOkL8Bjl9Ki6S9LBCI=
X-Gm-Gg: ASbGncsHI4X7rW5SE5ovHHGHz1geWtIdXlkSZ8dl7zEZjEe6RxObrwlL/ez/rbjLGwc
 A2J2fikHZCnc9Z1NJWiNg4Ihm5l9yEnIbQCufYaSXFbsRmjwdnRFmqnmF7MGkXTVeccDMaQ2+0M
 6o0Zx0shyBirWOJ4X8msG3hff2xKuDVDA=
X-Google-Smtp-Source: AGHT+IFlBlVnRPEejI7uEQI0m4iJ7XD5elQtat++i3WnHxfOw553GLb37rOpDc90WmrXZut9Lu8B9Qiwq9FX49Bc1Ek=
X-Received: by 2002:a05:6214:f0c:b0:6eb:28e4:8519 with SMTP id
 6a1803df08f44-6f8b2c7b1d5mr412061496d6.21.1747926722029; Thu, 22 May 2025
 08:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
In-Reply-To: <20250521162216.79dd3290@booty>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 23 May 2025 00:11:24 +0900
X-Gm-Features: AX0GCFtvRxj4ujyC4Z2jHUwkVIe890MFPlPN-fSj8wgEwb2IYi_zfj6mGd98q30
Message-ID: <CAAQKjZPX3iQgNhEydDZXMyC9BRuep7kL-XYEsjnkCxSt_1UsQg@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Adam Ford <aford173@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pin-yen Lin <treapking@chromium.org>, Ian Ray <ian.ray@gehealthcare.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Phong LE <ple@baylibre.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org, Martyn Welch <martyn.welch@collabora.co.uk>,
 linux-doc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Aradhya Bhatia <a-bhatia1@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Helge Deller <deller@gmx.de>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Liu Ying <victor.liu@nxp.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Andy Yan <andy.yan@rock-chips.com>,
 imx@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Vitalii Mordan <mordan@ispras.ru>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Benson Leung <bleung@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>, Aleksandr Mishin <amishin@t-argos.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Janne Grunau <j@jannau.net>, "Rob Herring \(Arm\)" <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v3 00/22] drm: convert all bridges to
	devm_drm_bridge_alloc()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8gTHVjYSBDZXJlc29saSwKCjIwMjXrhYQgNeyblCAyMeydvCAo7IiYKSDsmKTtm4QgMTE6
MjMsIEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+64uY7J20IOyekeyE
sToKPgo+IEhlbGxvIE1heGltZSwgU2hhd24sIExpdSwgYWxsLAo+Cj4gT24gRnJpLCAwOSBNYXkg
MjAyNSAxNTo1MzoyNiArMDIwMAo+IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxp
bi5jb20+IHdyb3RlOgo+Cj4gPiBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBbMF0gaXMgdGhlIG5l
dyBBUEkgdG8gYWxsb2NhdGUgYW5kIGluaXRpYWxpemUgYSBEUk0KPiA+IGJyaWRnZSwgYW5kIHRo
ZSBvbmx5IG9uZSBzdXBwb3J0ZWQgZnJvbSBub3cgb24uIEl0IGlzIHRoZSBmaXJzdCBtaWxlc3Rv
bmUKPiA+IHRvd2FyZHMgcmVtb3ZhbCBvZiBicmlkZ2VzIGZyb20gYSBzdGlsbCBleGlzdGluZyBE
Uk0gcGlwZWxpbmUgd2l0aG91dAo+ID4gdXNlLWFmdGVyLWZyZWUuCj4KPiBJIGFwcGxpZWQgb24g
ZHJtLW1pc2MtbmV4dCBwYXRjaGVzIDMtMTcsMjAtMjEgYXMgdGhleSBtYXRjaCBhbGwgdGhlCj4g
Y3JpdGVyaWE6Cj4gIC0gQXQgbGVhc3QgYSBBY2tlZC1ieSAob3IgUi1ieSBtYWludGFpbmVycykK
PiAgLSBwYXRjaCBpcyBmb3IgZHJtLW1pc2MKPgo+IEJlaW5nIG15IHZlcnkgZmlyc3QgY29tbWl0
cyB0byBkcm0tbWlzYywgSSB0cmllZCB0byBiZSBjYXJlZnVsLCBhbmQKPiBkb3VibGUgY2hlY2tl
ZCBhbGwgdGhlIHBhdGNoZXMgd2l0aCBMb3VpcyAodGhhbmtzISkuCj4KPiBIZXJlIGFyZSB0aGUg
cGVuZGluZyBxdWVzdGlvbnMgYW5kIHBsYW4gZm9yIHRoZSByZW1haW5pbmcgcGF0Y2hlcy4KPgo+
ID4gICAgICAgUmV2ZXJ0ICJkcm0vZXh5bm9zOiBtaWM6IGNvbnZlcnQgdG8gZGV2bV9kcm1fYnJp
ZGdlX2FsbG9jKCkgQVBJIgo+Cj4gVGhpcyByZXZlcnRzIHRoZSBjb21taXQgYXBwbGllZCBteSBt
aXN0YWtlOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbWlzYy9rZXJuZWwv
LS9jb21taXQvOTFjNWM3YjViYjJkZDA5YjQzYjAyNWJjZTZkNzkwZDNjNzlmNDUxOAo+Cj4gTmVp
dGhlciB0aGUgIG9yaWdpbmFsIHBhdGNoIG5vciB0aGUgcmV2ZXJ0IGhhcyBiZWVuIHJldmlld2Vk
L2Fja2VkLgo+Cj4gQXMgdGhlIGNvbW1pdCB3YXMgYSBtaXN0YWtlLCBJJ20gYXBwbHlpbmcgdGhl
IHJldmVydCBieSB0aGUgZW5kIG9mIHRoaXMKPiB3ZWVrIChpLmUuIG9uIEZyaWRheSkgdW5sZXNz
IHRoZXJlIGFyZSBiZXR0ZXIgaW5zdHJ1Y3Rpb25zLgoKUmVhbGx5IHNvcnJ5IGZvciBsYXRlLiBJ
IHdhcyBtYWRlIGF3YXJlIG9mIGl0IGxhdGVyIHRocm91Z2ggYQpjb2xsZWFndWUncyByZW1hcmsu
IFRoZXJlIGlzIG5vIG5lZWQgdG8gcHJvY2VlZCB3aXRoIHRoZSByZXZlcnQuCkFja2VkLWJ5IDog
SW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgoKVGhhbmtzLApJbmtpIERhZQoKCj4KPiA+
ICAgICAgIGRybTogY29udmVydCBtYW55IGJyaWRnZSBkcml2ZXJzIGZyb20gZGV2bV9remFsbG9j
KCkgdG8gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgQVBJCj4KPiBUaGlzIHBhdGNoIGFmZmVjdHMg
bXVsdGlwbGUgZHJpdmVycy4gUnVubmluZyBnZXRfbWFpbnRhaW5lcnMucGwKPiBwb2ludHMgYXQg
U2hhd24gR3VvJ3MgcmVwb3NpdG9yeS4gQWZ0ZXIgcmV2aWV3aW5nIHRoZSBNQUlOVEFJTkVSUyBm
aWxlLAo+IHRoaXMgbG9va3MgbGlrZSBkdWUgdG8gdGhlICdOOicgbGluZSBpbjoKPgo+IEFSTS9G
UkVFU0NBTEUgSU1YIC8gTVhDIEFSTSBBUkNISVRFQ1RVUkUKPiBNOiAgICAgIFNoYXduIEd1byA8
c2hhd25ndW9Aa2VybmVsLm9yZz4KPiBNOiAgICAgIFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5n
dXRyb25peC5kZT4KPiBSOiAgICAgIFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVu
Z3V0cm9uaXguZGU+Cj4gLi4uCj4gVDogICAgICBnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3NoYXduZ3VvL2xpbnV4LmdpdAo+IE46ICAgICAgaW14Cj4g
Li4uCj4KPiAoaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9taXNjL2tlcm5lbC8t
L2Jsb2IvZHJtLW1pc2MtbmV4dC9NQUlOVEFJTkVSUz9yZWZfdHlwZT1oZWFkcyNMMjUxMS0yNTI4
KQo+Cj4gSGVyZSAnaW14JyBtYXRjaGVzIHRoZSAnZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbXgv
aW14LWxlZ2FjeS1icmlkZ2UuYycKPiBmaWxlIHRoYXQgaXMgdG91Y2hlZCBieSB0aGUgcGF0Y2gu
IFRoYXQgcmVnZXhwIGFwcGVhcnMgb3Zlcmx5IGdlbmVyaWMgdG8gbWUuCj4KPiBTaGF3biwgY2Fu
IGl0IGJlIGZpeGVkIGJ5IG1ha2luZyBpdCBsZXNzIGdlbmVyaWM/Cj4KPiBJZiBub3QsIGNhbiB3
ZSBhdCBsZWFzdCBhZGQgYSBiYW5kLWFpZCAnWDonIGVudHJ5IGZvcgo+IGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvaW14Pwo+Cj4gSSB0aGluayB0aGUgb3RoZXIgbWF0Y2hpbmcgZW50cnkgaXMgdGhl
IG9uZSB0byBjb25zaWRlcjoKPgo+IERSTSBEUklWRVJTIEZPUiBGUkVFU0NBTEUgSU1YIEJSSURH
RQo+IE06ICAgICAgTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4KPiBMOiAgICAgIGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTOiAgICAgIE1haW50YWluZWQKPiBGOiAgICAg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14
OHF4cC1sZGIueWFtbAo+IEY6ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXBpeGVsLWNvbWJpbmVyLnlhbWwKPiBGOiAgICAg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14
OHF4cC1waXhlbC1saW5rLnlhbWwKPiBGOiAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBpLnlhbWwKPiBGOiAgICAg
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW14Lwo+Cj4gKGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vbWlzYy9rZXJuZWwvLS9ibG9iL2RybS1taXNjLW5leHQvTUFJTlRBSU5FUlM/
cmVmX3R5cGU9aGVhZHMjTDc5NDAtNzk0OCkKPgo+IEhvd2V2ZXIgaXQgZG9lcyBub3QgbGlzdCBh
bnkgdHJlZXMuIEkgX2d1ZXNzXyBkcm0tbWlzYyBhcHBsaWVzIGhlcmUgYXMKPiBhIGZhbGxiYWNr
IGFzIHdlbGwgYXMgY29tbW9uIHNlbnNlLgo+Cj4gTGl1LCBzaG91bGQgdGhpcyBlbnRyeSBoYXZl
IGEgJ1Q6JyBsaW5lIGZvciBkcm0vbWlzYz8KPgo+ID4gICAgICAgZHJtL2JyaWRnZTogaW14OHF4
cC1waXhlbC1jb21iaW5lcjogY29udmVydCB0byBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBBUEkK
Pgo+IE5vdCBhY2tlZC9yZXZpZXdlZCwgc29tZSBkaXNjdXNzaW9uIGhhcHBlbmVkLiBJIGFtIHJl
c2VuZGluZyBpdCBpbiB2NCwKPiBwb3NzaWJseSB3aXRoIHVwZGF0ZXMgYmFzZWQgb24gdGhlIGRp
c2N1c3Npb24uCj4KPiBCdXQgaXQgaGFzIHRoZSBzYW1lIGlzc3VlIGRpc2N1c3NlZCBhYm92ZSwg
d2l0aCBnZXRfbWFpbnRpbmVycy5wbAo+IHBvaW50aW5nIGF0IFNoYXduIEd1bydzIHRyZWUsIHNv
IGluIHRoZSBmdXR1cmUgSSdtIGFzc3VtaW5nIHRoaXMgZ29lcwo+IHRvIGRybS1taXNjIHVubGVz
cyB0aGVyZSBhcmUgbmV3cyBhYm91dCB0aGF0Lgo+Cj4gPiAgICAgICBkcm0vYnJpZGdlOiB0YzM1
ODc2NzogY29udmVydCB0byBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBBUEkKPgo+IE5vIGZlZWRi
YWNrLCByZXNlbmRpbmcgaW4gdjQuCj4KPiA+ICAgICAgIGRybS90b2RvOiBhZGQgZW50cnkgdG8g
cmVtb3ZlIGRldm1fZHJtX3B1dF9icmlkZ2UoKQo+Cj4gVGhpcyBpbnZvbHZlcyBkb2N1bWVudGF0
aW9uIG1haW50YWluZWQgb24gYW5vdGhlciB0cmVlLiBXaGVyZSBzaG91bGQgaXQKPiBiZSBhcHBs
aWVkPyBUaGVyZSBhcmUgdHdvIG1hdGNoaW5nIGVudHJpZXMgaW4gTUFJTlRBSU5FUlM6Cj4KPiAg
KiBEUk0gRFJJVkVSUyAtPiB0aGUgZHJtIHRyZWUKPiAgKiBEUk0gRFJJVkVSUyBBTkQgTUlTQyBH
UFUgUEFUQ0hFUyAtPiB0aGUgZHJtLW1pc2MgdHJlZQo+Cj4gVG8gbWUgaXQgbG9va3MgbGlrZSB0
aGUgc2Vjb25kIGlzIG9idmlvdXNseSB0aGUgY2xvc2VzdCBtYXRjaCBhcyB3ZSBhcmUKPiBkZWFs
aW5nIHdpdGggRFJNIGJyaWRnZXMsIHNvIEknbSBhcHBseWluZyB0aGlzIGFzIHdlbGwgb24gRnJp
ZGF5IHVubGVzcwo+IHRoZXJlIGFyZSBiZXR0ZXIgaW5zdHJ1Y3Rpb25zLgo+Cj4gQmVzdCByZWdh
cmRzLAo+IEx1Y2EKPgo+IC0tCj4gTHVjYSBDZXJlc29saSwgQm9vdGxpbgo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
