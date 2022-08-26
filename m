Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F14985A2BAE
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Aug 2022 17:51:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97D91C640FE;
	Fri, 26 Aug 2022 15:51:33 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BE75C640FC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 15:51:31 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id e28so1563104qts.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 08:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=FesPnI2XuGI2A/F80YHcfjcFtoY5eMqDAbWBbAutgu0=;
 b=Tb1NPOfLTTuZPV2OEeyPMKLrpCOa8GCeaT0SfZHEK1oPlezyF0I58nu8WzeKr9AW0y
 Om0g2tQUPpuHWClziyqnLqltAWbr+sjQ1oCYMCnTOchwtO9/Uyq8eW7wrYQlC4G60rjS
 5KHcMSODDfgszM9scFQhvPE25sO7yDB7vGPEFX1LcFRNNvb/Staxrf8f7pFmIdWmHigQ
 Dl70sf7T82JxR8xYxTVeRZZE2cNtazPkTwd/SqUGJZLCfIkosqtgwuwuyfBD5pdk18Jy
 3mYVORFJwlPkuayJ6qdEFEnoariQUKPkvTd0ZlGr3ugh7PGZREdBasFgOQfurMS6fg6e
 jP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=FesPnI2XuGI2A/F80YHcfjcFtoY5eMqDAbWBbAutgu0=;
 b=m6eGlh3R5Zsn5dp/WZICOQQv4OA0U7qvbYRAorOntMWwSu+a9q5BUyQfuNGh3dFjse
 +V4GL0Bqknk0oUdKcEonH5/vmk56zMnZg6Z0xwvuYVQX0mZ1zaOP/2LW7pAUfyUm9x+V
 RwQCepMCbbXwvXN4veqfBDyWGuJ7vw0IdsacTRlELXR/jVf2wLZHI/Bw5MOYR5mW/242
 D6dc3PIl1YMRmW6OmlgCrB9ypj/tQCzS3YjHpg1FIRt0Lw9jkwaSBrD4U0hS8OhGH0SQ
 DYp0ohYckI0HSw8iyaRcoYH/Uge1/re2DKg3rALn7UdS83hUVvCLvA3LxT2e5oB+7iFe
 4usw==
X-Gm-Message-State: ACgBeo1gVeRXPLhOpw7egXUUHPD22LFrlsZJOVL/3f7jEEk9HrZDj3Aj
 JWJd+5HKpWmZHjh7XmOqqakL3Z6Jz0IRWyi1pfM=
X-Google-Smtp-Source: AA6agR4VGlk6KoIe8nbYogc4V3QKG0ZzM46cFZPVa7XoeVTCBC/6A5ViPmzidBFCq+bvi9tj/xF7S/yx8QEsIIGspxY=
X-Received: by 2002:ac8:7dd0:0:b0:344:afc1:b11d with SMTP id
 c16-20020ac87dd0000000b00344afc1b11dmr277022qte.195.1661529090174; Fri, 26
 Aug 2022 08:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220826144629.11507-1-ilpo.jarvinen@linux.intel.com>
 <20220826144629.11507-4-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20220826144629.11507-4-ilpo.jarvinen@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Aug 2022 18:50:54 +0300
Message-ID: <CAHp75Vc4NfZE6DxFnfeAS9fxnZHpxMjacHy1TsG8ib+FiCqFLQ@mail.gmail.com>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Jiri Slaby <jirislaby@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Richard Genoud <richard.genoud@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] serial: Add kserial_rs485 to avoid
 wasted space due to .padding
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

T24gRnJpLCBBdWcgMjYsIDIwMjIgYXQgNTo1MSBQTSBJbHBvIErDpHJ2aW5lbgo8aWxwby5qYXJ2
aW5lbkBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gU3RydWN0IHNlcmlhbF9yczQ4NSBoYXMg
YSAucGFkZGluZyBmaWVsZCB0byBtYWtlIHVhcGkgdXBkYXRlcyBlYXNpZXIuCgpUaGUgc3RydWN0
Cgo+IEl0IHdhc3RlcyBzcGFjZSwgaG93ZXZlci4gQ3JlYXRlIHN0cnVjdCBrc2VyaWFsX3JzNDg1
IHdoaWNoIGlzIGEga2VybmVyCj4gY291bnRlcnBhcnQgdy9vIHBhZGRpbmcuCj4KPiBrZXJuZWxf
c2VyaWFsX3JzNDg1X3RvX3VzZXJfcnM0ODUoKSdzIHJzNDg1IGNhbiBub3cgYmVjb21lIGNvbnN0
IGFzCj4gcGFkZGluZyBpcyBkZWFsdCB3aXRoaW4gdGhlIGxvY2FsIHZhcmlhYmxlLgoKLi4uCgo+
IC1zdGF0aWMgaW50IHVzZXJfcnM0ODVfdG9fa2VybmVsX3NlcmlhbF9yczQ4NShzdHJ1Y3Qgc2Vy
aWFsX3JzNDg1ICpyczQ4NSwKPiArc3RhdGljIGludCB1c2VyX3JzNDg1X3RvX2tlcm5lbF9zZXJp
YWxfcnM0ODUoc3RydWN0IGtzZXJpYWxfcnM0ODUgKnJzNDg1LAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBzZXJpYWxfcnM0ODUgX191
c2VyICpyczQ4NV91c2VyKQo+ICB7Cj4gLSAgICAgICBpZiAoY29weV9mcm9tX3VzZXIocnM0ODUs
IHJzNDg1X3VzZXIsIHNpemVvZigqcnM0ODUpKSkKPiArICAgICAgIHN0cnVjdCBzZXJpYWxfcnM0
ODUgcnM0ODVfdWFwaTsKPiArCj4gKyAgICAgICBpZiAoY29weV9mcm9tX3VzZXIoJnJzNDg1X3Vh
cGksIHJzNDg1X3VzZXIsIHNpemVvZigqcnM0ODUpKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FRkFVTFQ7Cgo+ICsgICAgICAgKnJzNDg1ID0gKigoc3RydWN0IGtzZXJpYWxfcnM0ODUgKikm
cnM0ODVfdWFwaSk7CgpTbyB3aXRoIGFsbCBhc3NldHMgd2UgaGF2ZSB3ZSBjYW4gYmUgc3VyZSB0
aGF0IG9uIEJFNjQgLyBCRTMyIG1hY2hpbmVzCnRoaXMgd2lsbCBiZSBmbGF3bGVzcy4gSXMgdGhp
cyBhc3N1bXB0aW9uIGNvcnJlY3Q/Cgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KCi4uLgoKPiAg
c3RhdGljIGludCBrZXJuZWxfc2VyaWFsX3JzNDg1X3RvX3VzZXJfcnM0ODUoc3RydWN0IHNlcmlh
bF9yczQ4NSBfX3VzZXIgKnJzNDg1X3VzZXIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHNlcmlhbF9yczQ4NSAqcnM0ODUpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGtzZXJpYWxf
cnM0ODUgKnJzNDg1KQo+ICB7Cj4gKyAgICAgICBzdHJ1Y3Qgc2VyaWFsX3JzNDg1IHJzNDg1X3Vh
cGk7Cgo+ICsgICAgICAgKigoc3RydWN0IGtzZXJpYWxfcnM0ODUgKikmcnM0ODVfdWFwaSkgPSAq
cnM0ODU7CgpEaXR0by4KCisgQmxhbmsgbGluZT8KCj4gICAgICAgICAvKiBSZXR1cm4gY2xlYW4g
cGFkZGluZyBhcmVhIHRvIHVzZXJzcGFjZSAqLwo+IC0gICAgICAgbWVtc2V0KHJzNDg1LT5wYWRk
aW5nMCwgMCwgc2l6ZW9mKHJzNDg1LT5wYWRkaW5nMCkpOwo+IC0gICAgICAgbWVtc2V0KHJzNDg1
LT5wYWRkaW5nMSwgMCwgc2l6ZW9mKHJzNDg1LT5wYWRkaW5nMSkpOwo+ICsgICAgICAgbWVtc2V0
KHJzNDg1X3VhcGkucGFkZGluZzAsIDAsIHNpemVvZihyczQ4NV91YXBpLnBhZGRpbmcwKSk7Cj4g
KyAgICAgICBtZW1zZXQocnM0ODVfdWFwaS5wYWRkaW5nMSwgMCwgc2l6ZW9mKHJzNDg1X3VhcGku
cGFkZGluZzEpKTsKPgo+IC0gICAgICAgaWYgKGNvcHlfdG9fdXNlcihyczQ4NV91c2VyLCByczQ4
NSwgc2l6ZW9mKCpyczQ4NSkpKQo+ICsgICAgICAgaWYgKGNvcHlfdG9fdXNlcihyczQ4NV91c2Vy
LCAmcnM0ODVfdWFwaSwgc2l6ZW9mKHJzNDg1X3VhcGkpKSkKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FRkFVTFQ7Cj4KPiAgICAgICAgIHJldHVybiAwOwoKLi4uCgo+ICsvKiBDb21waWxlLXRp
bWUgYXNzZXJ0cyBmb3Iga3NlcmlhbF9yczQ4NSBhbmQgc2VyaWFsX3JzNDg1IGVxdWFsaXR5IChl
eGNlcHQgcGFkZGluZykgKi8KCnN0cnVjdCBrc2VyaWFsX3JzNDg1CnN0cnVjdCBzZXJpYWxfcnM0
ODUKCihyYXRpb25hbGU6IHN0YW5kYXJkIHJlcHJlc2VudGF0aW9uIGluIHRleHQgLyBjb21tZW50
cyBhbmQgYmUgYSBsaW5rCmluIGNhc2UgaWYgdGhpcyBpcyBjb252ZXJ0ZWQgdG8ga2VybmVsIGRv
YykKCi4uLgoKPiArLyoKPiArICogTXVzdCBtYXRjaCB3aXRoIHNlcmlhbF9yczQ4NSBpbiBpbmNs
dWRlL3VhcGkvbGludXgvc2VyaWFsLmggZXhjbHVkaW5nIHRoZQoKRGl0dG8uCgo+ICsgKiBwYWRk
aW5nLgo+ICsgKi8KPiArc3RydWN0IGtzZXJpYWxfcnM0ODUgewo+ICsgICAgICAgX191MzIgICBm
bGFnczsgICAgICAgICAgICAgICAgICAvKiBSUzQ4NSBmZWF0dXJlIGZsYWdzICovCj4gKyAgICAg
ICBfX3UzMiAgIGRlbGF5X3J0c19iZWZvcmVfc2VuZDsgIC8qIERlbGF5IGJlZm9yZSBzZW5kICht
aWxsaXNlY29uZHMpICovCj4gKyAgICAgICBfX3UzMiAgIGRlbGF5X3J0c19hZnRlcl9zZW5kOyAg
IC8qIERlbGF5IGFmdGVyIHNlbmQgKG1pbGxpc2Vjb25kcykgKi8KPiArICAgICAgIHN0cnVjdCB7
Cj4gKyAgICAgICAgICAgICAgIF9fdTggICAgYWRkcl9yZWN2Owo+ICsgICAgICAgICAgICAgICBf
X3U4ICAgIGFkZHJfZGVzdDsKPiArICAgICAgIH07CgpCdHcsIGNhbid0IHdlIGNvbnZlcnQgdGhl
bSB0byBrZXJuZWwgZG9jPwoKPiArfTsKCi4uLgoKPiArICogVGhlcmUncyBrZXJuZWwgY291bnRl
cnBhcnQga3NlcmlhbF9yczQ4NSBvZiB0aGlzIHN0cnVjdCB3aXRob3V0IHBhZGRpbmcuCgpzdHJ1
Y3Qga3NlcmlhbF9yczQ4NQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
