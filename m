Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 657DD4A57F0
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Feb 2022 08:42:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11595C6046E;
	Tue,  1 Feb 2022 07:42:53 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3997C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 18:04:50 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 y5-20020a17090aca8500b001b8127e3d3aso3082pjt.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 10:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c4Q5GbHlG477GDu8eKVa3wxvGBbayrQI0q4Ora6UJKM=;
 b=tqRPGJPSBTirucVoZRcW3Pfn8BwsifiN/2zFudpAcytP87mX6mRx+Z2+R8wpSJO6rJ
 E21sG6i5x1UJi7SIERlnMvo8Jw0MLeFM6mvgDhxTj45ED5x+ylbmR3r1yaZ8mJx2fzpx
 udWsOYVxp3K/E4/g+A1Uv/ovIRjY7g5AdBlMS01qOGp/RnNoU+KHggkPTU0eVD0DU8s9
 0BeQOAnHzHWADyIK4Vu+WAIlTn0apQDnBPfgCcsWeZOXKK9/5IWZ2oh4MKVGtqnRvPWe
 5941r9GmvDJ9BaTRBHT9nHnwJ9e+INLC12aBfS+Ob2isiRQG967ObJegi9wJYUDWinQX
 qgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c4Q5GbHlG477GDu8eKVa3wxvGBbayrQI0q4Ora6UJKM=;
 b=CbxneFEi7O/bxaohUqCU4YTWBdtO0H8csH+XugCtiwXCP4gNG9DnZTq99T7mk/Z7D8
 oATRvI9hzhwNcZgCRKrX7+K1aqnOjFvg2bbgYwdHb93Sgo3h/eb9kf9jIe5FZcOdDWqy
 ZNHiL3eqrNNBN9jQDnFHxveTuNhTMU/15pGyfa6vgZbo9/TSbFL+WYTg/DXH5TAy57sk
 CH0eST1tceKeamyjiAHtwRqFFC7B3/FDcx5SRyfF5br/QyAWj4hoGyYjEpYW11R1UVH0
 B2EYcAPKITACSwKnZVWBBBZvzwYgVFqhJsdrXbBQCRJx6IX6Hxw0P7ipsM4EQBw49+8Y
 PJEA==
X-Gm-Message-State: AOAM531zztsTvef28FYsDI6t+ioMCe7ZP8XPJUXf6TqlSs0l1LnnKN9H
 WptiehvKqIiYetIIBIlZzLeSZg==
X-Google-Smtp-Source: ABdhPJwiCZ3y7ls9K5IfS1T6T0ClceNUAK7SZtIbNYVDQUzoxeIbETevQnD06wi4x9WLSkmqa1d5tw==
X-Received: by 2002:a17:902:d2c3:: with SMTP id
 n3mr21984876plc.45.1643652289541; 
 Mon, 31 Jan 2022 10:04:49 -0800 (PST)
Received: from [192.168.0.2] ([50.53.47.17])
 by smtp.gmail.com with ESMTPSA id y42sm19810173pfa.5.2022.01.31.10.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 10:04:49 -0800 (PST)
Message-ID: <e9e124b0-4ea0-e84c-cd8e-1c6ad4df9d74@pensando.io>
Date: Mon, 31 Jan 2022 10:04:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Content-Language: en-US
To: Saeed Mahameed <saeed@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20220131172450.4905-1-saeed@kernel.org>
From: Shannon Nelson <snelson@pensando.io>
In-Reply-To: <20220131172450.4905-1-saeed@kernel.org>
X-Mailman-Approved-At: Tue, 01 Feb 2022 07:42:52 +0000
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Awogbemila <awogbemila@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, rafal@milecki.pl,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Andy Gospodarek <andy@greyhouse.net>, Edwin Peer <edwin.peer@broadcom.com>,
 Wei Liu <wei.liu@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-sunxi@lists.linux.dev,
 Jiri Pirko <jiri@resnulli.us>, l.stelmach@samsung.com,
 Shay Agroskin <shayagr@amazon.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Jon Mason <jdmason@kudzu.us>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chris Snook <chris.snook@gmail.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Stefan Wahren <stefan.wahren@i2se.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Gabriel Somlo <gsomlo@gmail.com>,
 Rain River <rain.1986.08.12@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Shai Malin <smalin@marvell.com>, Maxime Ripard <mripard@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, drivers@pensando.io,
 Omkar Kulkarni <okulkarni@marvell.com>, linux-arm-kernel@lists.infradead.org,
 Vegard Nossum <vegard.nossum@oracle.com>, David Arinzon <darinzon@amazon.com>,
 UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catherine Sullivan <csully@google.com>, linux-hyperv@vger.kernel.org,
 oss-drivers@corigine.com, Noam Dagan <ndagan@amazon.com>,
 Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>,
 Simon Horman <simon.horman@corigine.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 Liming Sun <limings@nvidia.com>, Michael Chan <michael.chan@broadcom.com>,
 Salil Mehta <salil.mehta@huawei.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Oleksij Rempel <linux@rempel-privat.de>, Edward Cree <ecree.xilinx@gmail.com>,
 Saeed Bishara <saeedb@amazon.com>, Mark Einon <mark.einon@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Slark Xiao <slark_xiao@163.com>, Gary Guo <gary@garyguo.net>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Jeroen de Borst <jeroendb@google.com>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 intel-wired-lan@lists.osuosl.org, Prabhakar Kushwaha <pkushwaha@marvell.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Richard Cochran <richardcochran@gmail.com>, Marcin Wojtas <mw@semihalf.com>,
 David Thompson <davthompson@nvidia.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Saeed Mahameed <saeedm@nvidia.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: kbuild: Don't default net
 vendor configs to y
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMS8zMS8yMiA5OjI0IEFNLCBTYWVlZCBNYWhhbWVlZCB3cm90ZToKPiBGcm9tOiBTYWVlZCBN
YWhhbWVlZCA8c2FlZWRtQG52aWRpYS5jb20+Cj4KPiBORVRfVkVORE9SX1hZWiB3ZXJlIGRlZmF1
bHRlZCB0byAneScgZm9yIG5vIHRlY2huaWNhbCByZWFzb24uCj4KPiBTaW5jZSBhbGwgZHJpdmVy
cyBiZWxvbmdpbmcgdG8gYSB2ZW5kb3IgYXJlIHN1cHBvc2VkIHRvIGRlZmF1bHQgdG8gJ24nLAo+
IGRlZmF1bHRpbmcgYWxsIHZlbmRvcnMgdG8gJ24nIHNob3VsZG4ndCBiZSBhbiBpc3N1ZSwgYW5k
IGFsaWducyB3ZWxsCj4gd2l0aCB0aGUgJ25vIG5ldyBkcml2ZXJzJyBieSBkZWZhdWx0IG1lbnRh
bGl0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhZWVkIE1haGFtZWVkIDxzYWVlZG1AbnZpZGlhLmNv
bT4KPgoKSXMgdGhlcmUgYSBwYXJ0aWN1bGFyIHJlYXNvbiB0byBjaGFuZ2UgdGhpcz8KQnJva2Vu
IGNvbXBpbGVzP8KgIEJhZCBkcml2ZXJzP8KgIE92ZXItc2l6ZWQgb3V0cHV0PwoKc2xuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
