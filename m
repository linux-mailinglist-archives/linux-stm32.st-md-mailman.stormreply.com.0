Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B52766B32
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 13:00:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFA2EC6B465;
	Fri, 28 Jul 2023 11:00:46 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A68BDC6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 11:00:45 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-55acbe0c7e4so329248a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 04:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690542044; x=1691146844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jAU8K3a8dHy/tuEIb7Zpcs7Yfdt1964yvfWu4jQqUuw=;
 b=UrIAf3FUSIv8YxPhfTK3nLv5IcWt5sxAS/MbAn3DuvkbIaHb7LD1g2rsl9yDEOwdSh
 3vY0iX48P3rU4dTxIJB9eIHtKllX7TF/TQCeOHzvgsz3cWjLPstf2rQNO1zJWaoQn/gT
 UDXJsAlFDdBYgpQbSjyavgIMkKIzTkwmiiGHFsWFrOlEcyrmWSTfsQa90rXEFhKycdx3
 sDsjhtBzBwTjeYOFc5jeJUg3L02N3lkPbPRcUAFljwl+lxlzHq8CKGg/m/bq7o/rlqbu
 fBbHr2TW9PfmJwxLS25qzOzPs3WbUxIe2YYi58UyCNVMDhLqbq9r2TYFdyq5zGHKFDSJ
 cKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690542044; x=1691146844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jAU8K3a8dHy/tuEIb7Zpcs7Yfdt1964yvfWu4jQqUuw=;
 b=aod+tehwlnO15fzg0nklQhb9//vs+2XX2HaGiIXVqCyeAOPGHrNBMfGY8SuExLikH0
 UjgoIfxyW/oOTd83Rn1Lc60CIJla5w+wGH2FL7w5nGEuwHHYTjHwQifUtlL0OYwpI3gT
 wKLEhdDAlkkXdNZ4W4J/bdrRiEUe/55EB0/fZdsdTzX7amlhWowsSqRJ4dDv/GOXuta1
 0IMZ0ysQXnBEZvgLrUNk910fZKlw6m3dF5i0KZJS9QiiAzmGV/9ejMyDXH8TREcJmsN5
 XqxSs/6/t1qiuHYXzT5pZlWQoNd/n9qmTOegAWH9FTNOM6fOzcuiGU2rvodpGBjZymFU
 b4LA==
X-Gm-Message-State: ABy/qLYt510fVCKceQicsS0KaIbh5iK/6DpXJgQC9zxREUp9I7CgMRh4
 ToeeYnL8omS5EFTUzb5CnaG9lECT/SJ9/bFnJBY=
X-Google-Smtp-Source: APBJJlFRUaRTonS8rZhdy8awwpxcfDvB90VkuyRkJuU4rORotvPAMG3r669s1DgV5c8fsVRmEz9c48FJa+0b7z7329Q=
X-Received: by 2002:a17:90a:e4f:b0:267:f1dc:74ee with SMTP id
 p15-20020a17090a0e4f00b00267f1dc74eemr1975393pja.2.1690542044042; Fri, 28 Jul
 2023 04:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230727152503.2199550-1-shenwei.wang@nxp.com>
 <20230727152503.2199550-3-shenwei.wang@nxp.com>
In-Reply-To: <20230727152503.2199550-3-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 Jul 2023 08:00:32 -0300
Message-ID: <CAOMZO5ANQmVbk_jy7qdVtzs3716FisT2c72W+3WZyu7FoAochw@mail.gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: imx@lists.linux.dev, Simon Horman <simon.horman@corigine.com>,
 Frank Li <frank.li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 linux-amlogic@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Wong Vee Khee <veekhee@apple.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 net 2/2] net: stmmac: dwmac-imx: pause
	the TXC clock in fixed-link
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMTI6MjXigK9QTSBTaGVud2VpIFdhbmcgPHNoZW53ZWku
d2FuZ0BueHAuY29tPiB3cm90ZToKCj4gICAgICAgICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2Rh
dGEgKnBsYXRfZGF0ID0gcHJpdjsKPiBAQCAtMzE3LDggKzM1OSwxMSBAQCBzdGF0aWMgaW50IGlt
eF9kd21hY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgcGxh
dF9kYXQtPmV4aXQgPSBpbXhfZHdtYWNfZXhpdDsKPiAgICAgICAgIHBsYXRfZGF0LT5jbGtzX2Nv
bmZpZyA9IGlteF9kd21hY19jbGtzX2NvbmZpZzsKPiAgICAgICAgIHBsYXRfZGF0LT5maXhfbWFj
X3NwZWVkID0gaW14X2R3bWFjX2ZpeF9zcGVlZDsKPiArICAgICAgIGlmIChvZl9tYWNoaW5lX2lz
X2NvbXBhdGlibGUoImZzbCxpbXg5MyIpKQo+ICsgICAgICAgICAgICAgICBwbGF0X2RhdC0+Zml4
X21hY19zcGVlZCA9IGlteF9kd21hY19maXhfc3BlZWRfbXg5MzsKClNvIHlvdSBhcmUgZm9yY2lu
ZyB0aGlzIG9uIGFsbCBpbXg5MyBib2FyZHMsIGV2ZW4gaWYgdGhleSBkb24ndCB1c2UgYSBTSkEx
MTA1LgoKQW5kcmV3IEx1bm4gZ2F2ZSB0aGUgZm9sbG93aW5nIGZlZWRiYWNrIGluIHYxOgoKIlRo
ZSBTSkExMTA1IGhhcyB0aGUgcHJvYmxlbSwgc28gaSB3b3VsZCBleHBlY3QgaXQgdG8gYmUgaW52
b2x2ZWQgaW4KdGhlIHNvbHV0aW9uLiBPdGhlcndpc2UsIGhvdyBpcyB0aGlzIGdvaW5nIHRvIHdv
cmsgZm9yIG90aGVyIE1BQwpkcml2ZXJzPwoKTWF5YmUgeW91IG5lZWQgdG8gZXhwb3NlIGEgY29t
bW9uIGNsb2NrIGZyYW1ld29yayBjbG9jayBmb3IgdGhlIFRYQwpjbG9jayBsaW5lLCB3aGljaCB0
aGUgU0pBMTEwNSBjYW4gZGlzYWJsZS9lbmFibGU/IFRoYXQgdGhlbiBtYWtlcyBpdApjbGVhciB3
aGF0IG90aGVyIE1BQyBkcml2ZXJzIG5lZWQgdG8gZG8uIgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
