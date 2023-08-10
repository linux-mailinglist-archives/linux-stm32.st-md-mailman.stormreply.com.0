Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B07E1778368
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Aug 2023 00:02:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 664F8C6B469;
	Thu, 10 Aug 2023 22:02:52 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7F19C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 22:02:51 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-34985c13235so16925ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 15:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691704970; x=1692309770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WirRslw/0aDPkGhNScoiXM3zTY4G823fT91ETu+Lq6E=;
 b=UkdroNGwQrguLsDBgIEgrLvfKjn25h5tidmJjeYWOg8t5dssZ1517XjbYhdh/tiPNO
 EBpB6lGHrYvSxe5RzWSp9mAptNk9c7Meu+AWFWKissa9cQSd6+yCsJvq60LFZ+jCOIVe
 Rr9sVB8JIfibwVkOG/suomrjoOrY2Geo4BFVDD8CLiVSW1pNChr4tcICXZFee5TT8RAD
 PTG3bqf+yehy7fQNyjY/+xRXxvjckVSUSD5M+mjFhnQ5t5KXv1ApBtrP6GoofG9Sl8Hn
 9PCfxaJ/p5/oV6OwPWYN3qCFQUI38smFiA3zq2al3YjMc6Mg2brfo88yQImylhrW4ewn
 S55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691704970; x=1692309770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WirRslw/0aDPkGhNScoiXM3zTY4G823fT91ETu+Lq6E=;
 b=WQ3pRJ2yAdGg7YJ8wYlH7j82yLtRLNF3FPmWq3zPA/suYTyZxxW+LNSnrnt8UYoojK
 8XueYL3s/PtNlAQN9YnPwspPXlwHb4cDt5/fwVrPPP2bww0TC/6/zYSosTxNchy17rtl
 5NJ9ax4MUbCtG/I3fCwF2q9P4iqXpJHsEJGcYoLa6zKYPgDE/F1+k6/7vUJozN5RrK6I
 h/3XNKAHoxIYyopwsYN6C49BSACNtKEfiXrtVaO9G9uShoZWrbmne70Fbg7rKT+Rv+tK
 8nGXZvP/OzBz43EdLH6rl0Sq7CIdd1HMZvclI4F34Yj6kT4sRORg//V+31xcBblU9Fsz
 eaSw==
X-Gm-Message-State: AOJu0YxwPWKmGwNscoJ5SJZAjblmKzQuuv9ryZDvfiQZD3nnl/Lrn/hE
 UCTKFfvVI080ykN00G5mE5HvHjinBgsJUh8OlVmHJQ==
X-Google-Smtp-Source: AGHT+IEVz2QXUNlQHls+sgcBM1Gy6AYEvav8ViVH8f0MUbcqC3NuL9+xkH/d3pXnSUlrKBHYSG/nFcIRqELsmKHUvDg=
X-Received: by 2002:a05:6e02:1987:b0:346:1919:7c9b with SMTP id
 g7-20020a056e02198700b0034619197c9bmr112579ilf.26.1691704970628; Thu, 10 Aug
 2023 15:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230803-fix-typo-v1-1-b794378d594e@manank.me>
 <ZMwRzQC+wBgJpDfr@kernel.org>
In-Reply-To: <ZMwRzQC+wBgJpDfr@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 10 Aug 2023 15:02:37 -0700
Message-ID: <CAP-5=fW_bC1s+43My1cXmF_og7SE4=8K=ZZn82WNSGqAo849oQ@mail.gmail.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Edward <edward.baker@intel.com>
Cc: Manank Patel <manank@manank.me>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 Jens Schleusener <Jens.Schleusener@fossies.org>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] tools: perf: pmu-events: Fix typo
	poiint->point
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAxOjQ14oCvUE0gQXJuYWxkbyBDYXJ2YWxobyBkZSBNZWxv
IDxhY21lQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRW0gVGh1LCBBdWcgMDMsIDIwMjMgYXQgMTE6
Mjc6MzBBTSArMDUzMCwgTWFuYW5rIFBhdGVsIGVzY3JldmV1Ogo+ID4gRml4IHR5cG8gaW4gZmls
ZSBmbG9hdGluZy1wb2ludC5qc29uIGluIC9hcmNoL3g4Ni93ZXN0bWVyZWVwLWRwCj4KPiBBRkFJ
SyB0aGVzZSBhcmUgZ2VuZXJhdGVkIHVzaW5nIGEgdG9vbCwgc28gdGhlIGZpeCBuZWVkcyB0byBn
byB0byB0aGUKPiBmaWxlIGZyb20gd2hlcmUgdGhlIEpTT04gZmlsZXMgYXJlIGdlbmVyYXRlZCwg
SWFuPwoKWWVzLCB0aGVzZSBhcmUgZ2VuZXJhdGVkIGJ5IHRoZSBzY3JpcHQ6Cmh0dHBzOi8vZ2l0
aHViLmNvbS9pbnRlbC9wZXJmbW9uL2Jsb2IvbWFpbi9zY3JpcHRzL2NyZWF0ZV9wZXJmX2pzb24u
cHkKQWRkZWQgRWR3YXJkIEJha2VyIGF0IEludGVsIHdobyBjYW4gY29ycmVjdCB0aGVzZSBpc3N1
ZXMgYXQgc291cmNlLgoKVGhhbmtzLApJYW4KCj4gLSBBcm5hbGRvCj4KPiA+IFJlcG9ydGVkLWJ5
OiBKZW5zIFNjaGxldXNlbmVyIDxKZW5zLlNjaGxldXNlbmVyQGZvc3NpZXMub3JnPgo+ID4gTGlu
azogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU4OTEKPiA+
IFNpZ25lZC1vZmYtYnk6IE1hbmFuayBQYXRlbCA8bWFuYW5rQG1hbmFuay5tZT4KPiA+IC0tLQo+
ID4gIHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3g4Ni93ZXN0bWVyZWVwLWRwL2Zsb2F0aW5n
LXBvaW50Lmpzb24gfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9h
cmNoL3g4Ni93ZXN0bWVyZWVwLWRwL2Zsb2F0aW5nLXBvaW50Lmpzb24gYi90b29scy9wZXJmL3Bt
dS1ldmVudHMvYXJjaC94ODYvd2VzdG1lcmVlcC1kcC9mbG9hdGluZy1wb2ludC5qc29uCj4gPiBp
bmRleCBjMDNmODk5MGZhODIuLjE5NmFlMWQ5YjE1NyAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Bl
cmYvcG11LWV2ZW50cy9hcmNoL3g4Ni93ZXN0bWVyZWVwLWRwL2Zsb2F0aW5nLXBvaW50Lmpzb24K
PiA+ICsrKyBiL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3g4Ni93ZXN0bWVyZWVwLWRwL2Zs
b2F0aW5nLXBvaW50Lmpzb24KPiA+IEBAIC04LDcgKzgsNyBAQAo+ID4gICAgICAgICAgIlVNYXNr
IjogIjB4MSIKPiA+ICAgICAgfSwKPiA+ICAgICAgewo+ID4gLSAgICAgICAgIkJyaWVmRGVzY3Jp
cHRpb24iOiAiWDg3IEZsb2F0aW5nIHBvaWludCBhc3Npc3RzIGZvciBpbnZhbGlkIGlucHV0IHZh
bHVlIChQcmVjaXNlIEV2ZW50KSIsCj4gPiArICAgICAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJY
ODcgRmxvYXRpbmcgcG9pbnQgYXNzaXN0cyBmb3IgaW52YWxpZCBpbnB1dCB2YWx1ZSAoUHJlY2lz
ZSBFdmVudCkiLAo+ID4gICAgICAgICAgIkV2ZW50Q29kZSI6ICIweEY3IiwKPiA+ICAgICAgICAg
ICJFdmVudE5hbWUiOiAiRlBfQVNTSVNULklOUFVUIiwKPiA+ICAgICAgICAgICJQRUJTIjogIjEi
LAo+ID4KPiA+IC0tLQo+ID4gYmFzZS1jb21taXQ6IDVkMGMyMzBmMWRlOGM3NTE1YjY1NjdkOWFm
YmExZjE5NmZiNGUyZjQKPiA+IGNoYW5nZS1pZDogMjAyMzA4MDMtZml4LXR5cG8tM2NiMjA3Mjg0
MzEwCj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4gLS0KPiA+IE1hbmFuayBQYXRlbCA8bWFuYW5r
QG1hbmFuay5tZT4KPiA+Cj4KPiAtLQo+Cj4gLSBBcm5hbGRvCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
