Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id omyNBcF0Qmp17gkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 15:36:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 918CA6DB4B8
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 15:36:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=J5si2c5w;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42452C14541;
	Mon, 29 Jun 2026 13:36:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 004FDC424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 13:35:58 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4703bc0a99aso1103807f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 06:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782740158; x=1783344958;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
 b=J5si2c5wK5oENQqu5xhg7A7bT3u1qf1YNoMWWP7XEtl54RhIpQoNh8Rww4NPwPk6nQ
 wbhkP9jhDZKYcpAZjrcP2+7VSy6jC7qu+vA618rvRJ0tPygARHWAw1a9adsRzlskhfYr
 mntWTl63yjzLYiwXj/pzjJEwJLzl8Zg709oH3oYYlFvZFdSAD8Fup5CmN4XH32GGx6qn
 2xZLoOwT4CEE7WcJNHzXvlGDYq0ydtLlQwfp6+5dn+YbF9jb9wMQfWfwtw1GQ/oh/Q9U
 peeqW8MlwV2DDZf4G1xdJ/+qWGdCf9yLBY7pdoKjrUpE88ut+lZzU0uo2OxoAj0ogf1t
 XJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782740158; x=1783344958;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
 b=Q63LFaVc5MRpRKWpv6JVOFmrjMTHo9PhOQYfdRaTcLpQ6YchtkLoR4Y635pn0NxsRM
 xl4Wy/XFcNtmuofTZnBJLpB8tCvMnGjCuM+WkFLRz0Vbj7im6ygZj+qmW6Xv0gPmuLAd
 HGf6+/aA1auGbjUEWUE8oWBmx1kdmerKrUvUMgLXoS+NcDdq9gorEXAwg4SKjhu5TsRZ
 VKajo0ElRaZ0MeK1US0E/JXSde0YVnsYEJYjgjAGCvzHzBbQ/mZPEwxq++JxgzjzmLNY
 Y98/SWJ7fG/DuQ4lcwpbUbTfEo+UfKghz+oOlV6KlLTc8lvy679I9bsucweFig+mMfH2
 dlng==
X-Forwarded-Encrypted: i=1;
 AFNElJ/6Vq4laVNsfCgmv81IQfqwxTYEOFs2fFgi+yIDbZjyRHUE4UdEBVyeo0OiYTGrNARZKZdPGw8IfmWYkg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTbMw7aBEfqI2swiOumtDeUtIYVlxgP7W55YvNpzr+hEku2zVD
 7vWHcYUT3y/qQ9EWyASVhH6iv7A2X0gmzvmStR1LdNQdmmrH6aFlCwIa
X-Gm-Gg: AfdE7cmXQljN7gmwwVIYb31heK0iMI0K38xi0dl0VY1l5L70MHSY5ACHc9NA/bEWnIF
 wkoD2EHccWUM+a6V0NnvYcmwilwPsNAEMuyux3m0/WgiVg2n+pBo84y1SvSGEJi8u0GbaOFc0kv
 hmU5A+M3nrizu3gBVktwhm5PwyHG7ho4Wyn9xeJ5JzoNpY6uuq4PCRt7+VZl3vib0Ij41XcEaML
 6El7fVRoQWtjr00RaI3sBa/yPewSR56XrUVo1LSnWpa1rj4TnptPQwEamn+l4K6xHXz7OmC/zQ8
 RYR2pJneEvqNwTMEbWQhNkyKLgDojscDbQWLjHK1JBjtpqg9++3d3e6j1zjL2eWTQm/AtK1HNks
 tILQVd5Rm4Dk4Y1gGnynAOUxyMBbiIq8xFHusKZD950p7Ud86rWLeLppUTsGSIy5yg4Qmgc13nw
 QA781AZC2j/arwOoMRX/plogBpVwqRTGsip1G4ayTcyLgzZ9nRmnw2rnDEhTLFXFBkRkCTMbyvU
 XEFO2Z/
X-Received: by 2002:a05:600c:524e:b0:493:b2c1:b302 with SMTP id
 5b1f17b1804b1-493b2c1b445mr34652035e9.16.1782740157956; 
 Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47327c47122sm13954850f8f.34.2026.06.29.06.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Message-ID: <2496717f-12b9-4d33-b6db-1db278aee8e2@gmail.com>
Date: Mon, 29 Jun 2026 14:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v11 2/7] phy: qcom: add the SGMII
 SerDes PHY driver for SCMI systems
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:bartosz.golaszewski@linaro.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:lin
 ux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 918CA6DB4B8

SGkgQmFydG9zeiwKCk9uIDYvMjkvMjYgMTI6MjgsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6
Cj4gK2NvbmZpZyBQSFlfUUNPTV9TR01JSV9FVEhfU0NNSQo+ICsJdHJpc3RhdGUgIlF1YWxjb21t
IERXTUFDIFNHTUlJIFNlckRlcy9QSFkgZHJpdmVyIChmaXJtd2FyZSBtYW5hZ2VkKSIKPiArCWRl
cGVuZHMgb24gT0YgJiYgKEFSQ0hfUUNPTSB8fCBDT01QSUxFX1RFU1QpCj4gKwlzZWxlY3QgR0VO
RVJJQ19QSFkKPiArCXNlbGVjdCBQTV9HRU5FUklDX0RPTUFJTlMKPiArCWhlbHAKCkkgdGhpbmsg
UEhZX1FDT01fU0dNSUlfRVRIX1NDTUkgaXMgbWlzc2luZyBhIGRlcGVuZGVuY3kgb24gUE0uIEkg
Z2V0IGEKYnVpbGQgZXJyb3IgY3VycmVudGx5OgoKV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVu
ZGVuY2llcyBkZXRlY3RlZCBmb3IgUE1fR0VORVJJQ19ET01BSU5TCiAgRGVwZW5kcyBvbiBbbl06
IFBNIFs9bl0KICBTZWxlY3RlZCBieSBbeV06CiAgLSBQSFlfUUNPTV9TR01JSV9FVEhfU0NNSSBb
PXldICYmIE9GIFs9eV0gJiYgKEFSQ0hfUUNPTSB8fApDT01QSUxFX1RFU1QgWz15XSkKCmRyaXZl
cnMvcG1kb21haW4vY29yZS5jOiBJbiBmdW5jdGlvbiDigJhnZW5wZF9xdWV1ZV9wb3dlcl9vZmZf
d29ya+KAmToKZHJpdmVycy9wbWRvbWFpbi9jb3JlLmM6OTM2OjIwOiBlcnJvcjog4oCYcG1fd3Hi
gJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluCnRoaXMgZnVuY3Rpb24pCiAgOTM2IHwgICAgICAg
ICBxdWV1ZV93b3JrKHBtX3dxLCAmZ2VucGQtPnBvd2VyX29mZl93b3JrKTsKICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgXn5+fn4KZHJpdmVycy9wbWRvbWFpbi9jb3JlLmM6OTM2OjIwOiBub3Rl
OiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcwpyZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVh
Y2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgpkcml2ZXJzL3BtZG9tYWluL2NvcmUuYzogSW4gZnVu
Y3Rpb24g4oCYZ2VucGRfZGV2X3BtX3Fvc19ub3RpZmllcuKAmToKZHJpdmVycy9wbWRvbWFpbi9j
b3JlLmM6MTEzMzozOTogZXJyb3I6IOKAmHN0cnVjdCBkZXZfcG1faW5mb+KAmSBoYXMgbm8KbWVt
YmVyIG5hbWVkIOKAmGlnbm9yZV9jaGlsZHJlbuKAmQogMTEzMyB8ICAgICAgICAgICAgICAgICBp
ZiAoIWRldiB8fCBkZXYtPnBvd2VyLmlnbm9yZV9jaGlsZHJlbikKICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICBDQyAgICAgIG1tL3RydW5jYXRlLm8KCi0g
SnVsaWFuIEJyYWhhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
