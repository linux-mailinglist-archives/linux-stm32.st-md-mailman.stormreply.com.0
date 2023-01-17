Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEAA66D94B
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jan 2023 10:06:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84031C65E45;
	Tue, 17 Jan 2023 09:06:44 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD85FC65047
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 09:06:42 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id i12so21227562qvs.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 01:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zqiw1Vgwv9XN5UDZwZy7V1JCvqxayLwD+czwSJLGNXc=;
 b=Psgp67/kfCGo58IHNa1lEyOJXoWCpIR5x85MyyrDJoXfgixTFZiJwrgG6Z2AKRakmp
 zghbXg9ARJQlDo0kuxxNRWw3M6aIX9M3KaMcEbqpsTruamXxCyM3x3174jsLZIlnXDie
 S48FGLNi233/D0l7kHrnvDZo41pYXtWdvW2tcymtnhTIoNSiNIu1XoexByALK95nBW/h
 UkMtL3a9O7pfEmje61zV8JRPCXDyVy9Co2tfLOTiZyo6y0yRklbOxNq8m6Rco6jq/Y1y
 SOBAC54b+oXTSLnVDm3LckhRwCnjLlFPEywDcVrPLfUTS5sN1M/bNX0iGc2OQmErXu4P
 rcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zqiw1Vgwv9XN5UDZwZy7V1JCvqxayLwD+czwSJLGNXc=;
 b=WxJQGfvPVntpTHxRirCJlGQzBoesjgOEwu/O2V84rFayYkTmYeGe8SkuOOrQmbvS6V
 ies7qad5EzJmCP0qqmz6g+WXLHxAKNvWtolx1dwyv9RG9U9QXTsKW0MznoeKdzw6XTdZ
 lFw31jPcH3aUvhxVsm5SZjWxr6Ea4venBjWJVIVPG7MyATcO0O5ol3GTs17m8hndmYfc
 dxtSFstePnNyfaIXXf17//rkJ+elOws3Oz+gz6FXxMXBs9c7H6pHtjpbgAEYHnWKVG7K
 yFEQUH0P4YZE0W6QdQH/hCwQ3zkjO+Js/ueXJYp/IjMfDsatSv9j35lXRkU3UpN5wlQb
 4PVw==
X-Gm-Message-State: AFqh2krX9pt2iG3xilZvUfwKbOFmJpuCti0bDNvuYHson/fsvH2IIJkb
 91RIqvks+lu5OUopvH8fEXs9pVUBwBNiAv3Ct4E=
X-Google-Smtp-Source: AMrXdXugvDqNOWGB6Kj/gk3CK1DdfaCjiiHjRVIVFmtT0b0bZ7ODJdy3/f2SSMatSgKUUAIIRvAhojzcRgzJa2YLUfg=
X-Received: by 2002:a05:6214:418e:b0:532:2c82:95ac with SMTP id
 ld14-20020a056214418e00b005322c8295acmr149506qvb.97.1673946401725; Tue, 17
 Jan 2023 01:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei>
 <20230116204452.il4gase2szipeexz@SoMainline.org>
 <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com>
In-Reply-To: <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jan 2023 11:06:05 +0200
Message-ID: <CAHp75VdTftm1BE21rH1HVHiwUye-0Dvc66uCK2LE2qF4_zA6hg@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tomer Maimon <tmaimon77@gmail.com>,
 linux-iio@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>,
 openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Haibo Chen <haibo.chen@nxp.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Nancy Yuen <yuenn@google.com>,
 Andy Gross <agross@kernel.org>, linux-imx@nxp.com, linux-mips@vger.kernel.org,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 12/15] iio: adc: qcom-spmi-adc5:
	convert to device properties
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

T24gVHVlLCBKYW4gMTcsIDIwMjMgYXQgMTA6NTMgQU0gQW5keSBTaGV2Y2hlbmtvCjxhbmR5LnNo
ZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDE2LCAyMDIzIGF0IDEw
OjQ0IFBNIE1hcmlqbiBTdWlqdGVuCj4gPG1hcmlqbi5zdWlqdGVuQHNvbWFpbmxpbmUub3JnPiB3
cm90ZToKPiA+Cj4gPiBPbiAyMDIyLTA4LTA2IDE5OjIwOjQ4LCBKb25hdGhhbiBDYW1lcm9uIHdy
b3RlOgo+ID4gPiBPbiBGcmksIDE1IEp1bCAyMDIyIDE0OjI5OjAwICswMjAwCj4gPiA+IE51bm8g
U8OhIDxudW5vLnNhQGFuYWxvZy5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IE1ha2UgdGhlIGNv
bnZlcnNpb24gdG8gZmlybXdhcmUgYWdub3N0aWMgZGV2aWNlIHByb3BlcnRpZXMuIEFzIHBhcnQg
b2YKPiA+ID4gPiB0aGUgY29udmVyc2lvbiB0aGUgSUlPIGlua2VybiBpbnRlcmZhY2UgJ29mX3hs
YXRlKCknIGlzIGFsc28gY29udmVydGVkIHRvCj4gPiA+ID4gJ2Z3bm9kZV94bGF0ZSgpJy4gVGhl
IGdvYWwgaXMgdG8gY29tcGxldGVseSBkcm9wICdvZl94bGF0ZScgYW5kIGhlbmNlIE9GCj4gPiA+
ID4gZGVwZW5kZW5jaWVzIGZyb20gSUlPLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
TnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiA+ID4gPiBBY2tlZC1ieTogTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBBbmR5
IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+Cj4gPiA+ICtDQyBNYXJpamlu
IHdobyBoYXBwZW5kIHRvIHBvc3QgYSBwYXRjaCBmb3IgdGhpcyBkcml2ZXIgdGhhdCBJIGp1c3Qg
YWNjZXB0ZWQKPiA+ID4gYW5kIGhlbmNlIHByb2JhYmx5IGhhcyBoYXJkd2FyZSBhY2Nlc3MuICBB
bnkgY2hhbmNlIG9mIGEgdGVzdCBmb3IgdGhpcyBzZXJpZXM/Cj4gPiA+Cj4gPiA+IElmIG5vdCwg
bm8gcHJvYmxlbSBhcyB0aGlzIGlzIGZhaXJseSBtZWNoYW5pY2FsIGFuZCB3ZSBoYXZlIHRlc3Rp
bmcgb24gc29tZSBvZgo+ID4gPiB0aGUgb3RoZXIgZHJpdmVycyB1c2luZyB0aGUgbmV3IGNvZGUu
Cj4gPiA+Cj4gPiA+IEknbGwgcHJvYmFibHkgcXVldWUgdGhpcyB1cCBpbiB0aGUgbWVhbnRpbWUg
YnV0IGl0IHdvbid0IGVuZCB1cCB1cHN0cmVhbQo+ID4gPiBmb3IgYSBmZXcgd2Vla3MgeWV0Lgo+
ID4KPiA+IEpvbmF0aGFuLAo+ID4KPiA+IFRoaXMgQ0MganVzdCBzdXJmYWNlZCBpbiBteSBpbmJv
eCB3aGlsZSBzZWFyY2hpbmcgZm9yIG91ciBjdXJyZW50Cj4gPiBkaXNjdXNzaW9uIGFyb3VuZCBt
aXNzaW5nIGxhYmVscyBpbiBxY29tLXNwbWktdmFkYyAtIGFuZCBvbiB0aGUgc2lkZSBhCj4gPiB1
c2Vyc3BhY2UgQHh4IGxhYmVsIG5hbWUgQUJJIGJyZWFrIChpbiBxY29tLXNwbWktYWRjNSkgY2F1
c2VkIGJ5IHRoaXMKPiA+IHBhdGNoJ3MgZndub2RlX2dldF9uYW1lIGNoYW5nZSAtIHdlIGNvdWxk
J3ZlIGNhdWdodCBpdCBpZiBJIGhhZCBub3QKPiA+IGFjY2lkZW50YWxseSBtYXJrZWQgaXQgYXMg
cmVhZCBhbmQvb3IgZm9yZ290IGFib3V0IGl0LiAgTXkgYXBvbG9naWVzLgo+Cj4gRG9lcyB0aGUg
Zm9sbG93aW5nIGFkZGl0aW9uIHRvIHRoZSB0b3Agb2YgdGhlCj4gYWRjNV9nZXRfZndfY2hhbm5l
bF9kYXRhKCkgZml4IHRoZSBpc3N1ZT8KPgo+ICsgICAgICAgbmFtZSA9IGRldm1fa2FzcHJpbnRm
KGFkYy0+ZGV2LCBHRlBfS0VSTkVMLCAiJXBmd1AiLCBmd25vZGUpOwo+ICsgICAgICAgaWYgKCFu
YW1lKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKCk9rYXksIGl0IHByb2JhYmx5
IHRoZSBzYW1lLCBzbyBpdCBtaWdodCBuZWVkIGFkZGl0aW9uYWwgY29kZSB0bwoKKyBuYW1lW3N0
cmNocm51bChuYW1lLCAnQCcpIC0gbmFtZV0gPSAnXDAnOwoKLS0gCldpdGggQmVzdCBSZWdhcmRz
LApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
