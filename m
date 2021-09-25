Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42F417F47
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Sep 2021 04:17:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75B98C5A4F7;
	Sat, 25 Sep 2021 02:17:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9578EC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Sep 2021 02:17:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF92361029
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Sep 2021 02:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632536253;
 bh=D6mVq6Ws5LARrt0i89PJK+aDRPrFBg+LXJD8hpN1g/g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CViJisyPwkv5aUHbjwT60mL3x9qr1cZjSx1lpiNW8fc46hl26wDvn3hwTH0s+KQ9c
 txfOWQkvAjBtURVkGR4ZjryyWIceDcWsucyiUlxMDvl508YHexoHy90OLwRVl8gM8l
 9GPIChPhvYNDHP00usmTuRefu1vYliyayBzpFmFDhEy6ttTGLo8uUd97PheGMy0Vvt
 HGIFndGKjusR3hsiAtKoYJQroKz9GiNUEmbYqynCOb77nOjxEEqsmMJh8avv/DRhaU
 Ja/TMzNE48rwBRoV+oI0+aJdhkQNQlTGgHazEuGxmbUzmgd8kUMzbKCiQmwq0r202s
 FjTkTPIJLKJSA==
Received: by mail-ed1-f42.google.com with SMTP id x7so28464990edd.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 19:17:32 -0700 (PDT)
X-Gm-Message-State: AOAM533ec0MaYtKL+b50K2G6xQFNU7+PB5b3gY2dp/Np/r8TaZQ1BJjG
 vwO0ozLs0HOlX+BRY9O0Ty4Il79n/xxcZAEZlQ==
X-Google-Smtp-Source: ABdhPJy43x5ohkW8Db2PjWu46qMaTH2NqNO+cakkPZW/c2xsys2gf6YB/Ly9CvD7M2qmWakZbvEMWap8f0ltaHgNkUA=
X-Received: by 2002:aa7:c617:: with SMTP id h23mr8737188edq.357.1632536251531; 
 Fri, 24 Sep 2021 19:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Sep 2021 10:17:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY__VZ4Q5RsA4eiSfgLdwxg3HGV1-YEMa0L2LHHRdE73koQ@mail.gmail.com>
Message-ID: <CAAOTY__VZ4Q5RsA4eiSfgLdwxg3HGV1-YEMa0L2LHHRdE73koQ@mail.gmail.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: fshao@chromium.org, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>, DTML <devicetree@vger.kernel.org>,
 Nancy Lin <nancy.lin@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 roy-cw.yeh@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v11 05/16] dt-bindings: display: mediatek:
 merge: add additional prop for mt8195
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDnmnIgyMeaXpSDpgLHkuowg5LiL5Y2IMTE6NTLlr6vpgZPvvJoKPgo+IGFkZCBNRVJH
RSBhZGRpdGlvbmFsIHByb3BlcnRpZXMgZGVzY3JpcHRpb24gZm9yIG10ODE5NToKPiAxLiBhc3lu
YyBjbG9jawo+IDIuIGZpZm8gc2V0dGluZyBlbmFibGUKPiAzLiByZXNldCBjb250cm9sbGVyCj4K
PiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+
Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwgICAgICB8
IDMxICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbAo+IGluZGV4
IDc1YmVlYjIwN2NlYi4uNTQyZGQ3MTM3ZDNiIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxtZXJnZS55YW1sCj4gQEAgLTM4LDYgKzM4LDE5IEBAIHByb3BlcnRpZXM6Cj4g
ICAgY2xvY2tzOgo+ICAgICAgaXRlbXM6Cj4gICAgICAgIC0gZGVzY3JpcHRpb246IE1FUkdFIENs
b2NrCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IE1FUkdFIEFzeW5jIENsb2NrCj4gKyAgICAgICAg
ICBDb250cm9sbGluZyB0aGUgc3luY2hyb25vdXMgcHJvY2VzcyBiZXR3ZWVuIE1FUkdFIGFuZCBv
dGhlciBkaXNwbGF5Cj4gKyAgICAgICAgICBmdW5jdGlvbiBibG9ja3MgY3Jvc3MgY2xvY2sgZG9t
YWluLgo+ICsKPiArICBtZWRpYXRlayxtZXJnZS1maWZvLWVuOgo+ICsgICAgZGVzY3JpcHRpb246
Cj4gKyAgICAgIFRoZSBzZXR0aW5nIG9mIG1lcmdlIGZpZm8gaXMgbWFpbmx5IHByb3ZpZGVkIGZv
ciB0aGUgZGlzcGxheSBsYXRlbmN5Cj4gKyAgICAgIGJ1ZmZlciB0byBlbnN1cmUgdGhhdCB0aGUg
YmFjay1lbmQgcGFuZWwgZGlzcGxheSBkYXRhIHdpbGwgbm90IGJlCj4gKyAgICAgIHVuZGVycnVu
LCBhIGxpdHRsZSBtb3JlIGRhdGEgaXMgbmVlZGVkIGluIHRoZSBmaWZvLgo+ICsgICAgICBBY2Nv
cmRpbmcgdG8gdGhlIG1lcmdlIGZpZm8gc2V0dGluZ3MsIHdoZW4gdGhlIHdhdGVyIGxldmVsIGlz
IGRldGVjdGVkCj4gKyAgICAgIHRvIGJlIGluc3VmZmljaWVudCwgaXQgd2lsbCB0cmlnZ2VyIFJE
TUEgc2VuZGluZyB1bHRyYSBhbmQgcHJldWxyYQo+ICsgICAgICBjb21tYW5kIHRvIFNNSSB0byBz
cGVlZCB1cCB0aGUgZGF0YSByYXRlLgo+ICsgICAgdHlwZTogYm9vbGVhbgo+Cj4gICAgbWVkaWF0
ZWssZ2NlLWNsaWVudC1yZWc6Cj4gICAgICBkZXNjcmlwdGlvbjoKPiBAQCAtNTAsNiArNjMsMTEg
QEAgcHJvcGVydGllczoKPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3BoYW5kbGUtYXJyYXkKPiAgICAgIG1heEl0ZW1zOiAxCj4KPiArICByZXNldHM6Cj4gKyAg
ICBkZXNjcmlwdGlvbjogcmVzZXQgY29udHJvbGxlcgo+ICsgICAgICBTZWUgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L3Jlc2V0LnR4dCBmb3IgZGV0YWlscy4KPiArICAg
IG1heEl0ZW1zOiAxCj4gKwo+ICByZXF1aXJlZDoKPiAgICAtIGNvbXBhdGlibGUKPiAgICAtIHJl
Zwo+IEBAIC02NywzICs4NSwxNiBAQCBleGFtcGxlczoKPiAgICAgICAgICBwb3dlci1kb21haW5z
ID0gPCZzcG0gTVQ4MTczX1BPV0VSX0RPTUFJTl9NTT47Cj4gICAgICAgICAgY2xvY2tzID0gPCZt
bXN5cyBDTEtfTU1fRElTUF9NRVJHRT47Cj4gICAgICB9Owo+ICsKPiArICAgIG1lcmdlNTogZGlz
cF92cHBfbWVyZ2U1QDFjMTEwMDAwIHsKPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10ODE5NS1kaXNwLW1lcmdlIjsKPiArICAgICAgICByZWcgPSA8MCAweDFjMTEwMDAwIDAgMHgx
MDAwPjsKPiArICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNTA3IElSUV9UWVBFX0xFVkVM
X0hJR0ggMD47Cj4gKyAgICAgICAgY2xvY2tzID0gPCZ2ZG9zeXMxIENMS19WRE8xX1ZQUF9NRVJH
RTQ+LAo+ICsgICAgICAgICAgICAgICAgIDwmdmRvc3lzMSBDTEtfVkRPMV9NRVJHRTRfRExfQVNZ
TkM+Owo+ICsgICAgICAgIGNsb2NrLW5hbWVzID0gIm1lcmdlIiwibWVyZ2VfYXN5bmMiOwoKRGVm
aW5lIGNsb2NrLW5hbWVzIGZpcnN0LgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICAg
cG93ZXItZG9tYWlucyA9IDwmc3BtIE1UODE5NV9QT1dFUl9ET01BSU5fVkRPU1lTMT47Cj4gKyAg
ICAgICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZTEgU1VCU1lTXzFjMTFYWFhYIDB4
MDAwMCAweDEwMDA+Owo+ICsgICAgICAgIG1lZGlhdGVrLG1lcmdlLWZpZm8tZW4gPSA8MT47Cj4g
KyAgICAgICAgcmVzZXRzID0gPCZ2ZG9zeXMxIE1UODE5NV9WRE9TWVMxX1NXMF9SU1RfQl9NRVJH
RTRfRExfQVNZTkM+Owo+ICsgICAgfTsKPiAtLQo+IDIuMTguMAo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
