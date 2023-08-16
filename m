Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9634877E07D
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 13:35:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CC33C6B45F;
	Wed, 16 Aug 2023 11:35:19 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0814AC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 11:35:16 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-58d41109351so2602357b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 04:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692185716; x=1692790516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W1TXDu+zgSSUXElwM6x2NcHaHgdAL86FtyCcicPVe4Q=;
 b=GYrrZpOaEp+uLPVdkoRd7Z6CUNSRiET5q8N6nwMzb7556402t/9YMRUwFeA29t3HhT
 eLD2gEv+A1MUhjoDS6KkwaoFviuJc0wyhAPdSQqTG9LlMnM7GVUvbu5edi4j1JH/GW1Z
 /+HAQ8nV+PAcSF4EYlNX/VtOE47qFfDhJ+uCFQxeMRMDAHHbknrS4llKZsNfBye/smSz
 aaSrd/mqK2YH7AGJhVW+cohc8L95hZpDJY9dRjVhWFie4gpi3bSFxCyJ3g1JsAqCNm+V
 xQm7m1SW3RRC802vktsSLhwxCeyCNhwmEvevTa+6EhY1oQdA+kNDOWFr003P81Ih5EFw
 PMFA==
X-Gm-Message-State: AOJu0Yxr0h438eL+A+CHe2tYKmWYLn4v4Cy/a1M7LJAKHzciFs5PeWdG
 xOchYQ8HmpQuzwGs15ljftaSvvTOAxMiOA==
X-Google-Smtp-Source: AGHT+IFdunPFYCufZwauBUkTZgnaycha9DbANIF9wou6XQ3s8f8OnwdVOqYuFxfBHOHcmsD06aXemA==
X-Received: by 2002:a0d:d913:0:b0:583:821b:603a with SMTP id
 b19-20020a0dd913000000b00583821b603amr5560564ywe.20.1692185715199; 
 Wed, 16 Aug 2023 04:35:15 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 n186-20020a8172c3000000b0058605521e6esm3958404ywc.125.2023.08.16.04.35.14
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 04:35:14 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-d67305c80deso6801898276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 04:35:14 -0700 (PDT)
X-Received: by 2002:a25:abc7:0:b0:d71:99da:49b6 with SMTP id
 v65-20020a25abc7000000b00d7199da49b6mr1971998ybi.29.1692185714245; Wed, 16
 Aug 2023 04:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230801105932.3738430-1-arnd@kernel.org>
 <202308100045.WeVD1ttk-lkp@intel.com>
 <106a93ae-90f1-45fb-ae0a-034eb2d6faea@app.fastmail.com>
In-Reply-To: <106a93ae-90f1-45fb-ae0a-034eb2d6faea@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2023 13:35:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAO=-Qc71YWF2UFBVhbp55Fog-iUAuENNtiEP4xqx5ig@mail.gmail.com>
Message-ID: <CAMuHMdWAO=-Qc71YWF2UFBVhbp55Fog-iUAuENNtiEP4xqx5ig@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 kernel test robot <lkp@intel.com>, Alessandro Zummo <a.zummo@towertech.it>,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: remove incorrect #ifdef check
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

SGkgQXJuZCwKCk9uIFdlZCwgQXVnIDksIDIwMjMgYXQgODoyNuKAr1BNIEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+IE9uIFdlZCwgQXVnIDksIDIwMjMsIGF0IDE4OjM2LCBr
ZXJuZWwgdGVzdCByb2JvdCB3cm90ZToKPiA+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2Vw
YXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3Cj4gPiB2ZXJzaW9uIG9mCj4g
PiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCj4gPiB8
IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+IHwgQ2xv
c2VzOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDgxMDAw
NDUuV2VWRDF0dGstbGtwQGludGVsLmNvbS8KPiA+Cj4gPiBBbGwgd2FybmluZ3MgKG5ldyBvbmVz
IHByZWZpeGVkIGJ5ID4+KToKPiA+Cj4gPj4+IGRyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jOjkwMzox
Mjogd2FybmluZzogJ3N0bTMyX3J0Y19yZXN1bWUnIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1mdW5jdGlvbl0KPiA+ICAgICAgOTAzIHwgc3RhdGljIGludCBzdG0zMl9ydGNfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICAgICAgICAgIHwgICAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+Cj4gPj4+IGRyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jOjg5MzoxMjogd2FybmluZzogJ3N0
bTMyX3J0Y19zdXNwZW5kJyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25d
Cj4gPiAgICAgIDg5MyB8IHN0YXRpYyBpbnQgc3RtMzJfcnRjX3N1c3BlbmQoc3RydWN0IGRldmlj
ZSAqZGV2KQo+ID4gICAgICAgICAgfCAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+Cj4KPiBU
aGlzIGlzIHRoZSB3YXJuaW5nIHlvdSBnZXQgaWYgbXkgcGF0Y2ggaXMgYXBwbGllZCBidXQgdGhl
Cj4gZmI5YTdlNTM2MGRjOCAoInJ0Yzogc3RtMzI6IGNoYW5nZSBQTSBjYWxsYmFja3MgdG8gIl9u
b2lycSgpIiIpCj4gY29tbWl0IGlzIG5vdC4gSWYgdGhhdCBwYXRjaCBpcyBhcHBsaWVkLCBtaW5l
IGlzIG5lZWRlZCB0byBhZGRyZXNzCj4gdGhlIG90aGVyIHdhcm5pbmcuCgpBbHRob3VnaCBib3Ro
IGFyZSBub3cgaW4gbGludXgtbmV4dCwga2lzc2tiIHJlcG9ydGVkIGZvciBtNjhrL2FsbG1vZGNv
bmZpZzoKCiAgICBkcml2ZXJzL3J0Yy9ydGMtc3RtMzIuYzo5MDQ6MTI6IGVycm9yOiDigJhzdG0z
Ml9ydGNfcmVzdW1l4oCZIGRlZmluZWQKYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1mdW5j
dGlvbl0KICAgICAgOTA0IHwgc3RhdGljIGludCBzdG0zMl9ydGNfcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgKmRldikKICAgICAgICAgIHwgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+CiAgICBkcml2
ZXJzL3J0Yy9ydGMtc3RtMzIuYzo4OTQ6MTI6IGVycm9yOiDigJhzdG0zMl9ydGNfc3VzcGVuZOKA
mSBkZWZpbmVkCmJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtZnVuY3Rpb25dCiAgICAgIDg5
NCB8IHN0YXRpYyBpbnQgc3RtMzJfcnRjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogICAg
ICAgICAgfCAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+CgpTZWVtcyBsaWtlIHlvdSBtaXNz
ZWQgdGhhdCB0aGUgZHJpdmVyIHVzZXMgdGhlIG9sZApTRVRfTk9JUlFfU1lTVEVNX1NMRUVQX1BN
X09QUygpIGluc3RlYWQgb2YgdGhlIG5ldwpOT0lSUV9TWVNURU1fU0xFRVBfUE1fT1BTKCkuCgpQ
YXRjaCBzZW50LgpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwODE2MTEzMzI2LjE0Njg0
MzUtMS1nZWVydEBsaW51eC1tNjhrLm9yZwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
