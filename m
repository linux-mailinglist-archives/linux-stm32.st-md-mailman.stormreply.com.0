Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D682B5182A
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 15:43:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76ABEC36B3F;
	Wed, 10 Sep 2025 13:43:52 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3AB0C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 13:43:51 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-33730e1cda7so62302181fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 06:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757511831; x=1758116631;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYusx74gMgivYw43mzCgiUQelBrscv4e9WlUdU22ggg=;
 b=ye2Ay+a/440n8UFjgyXhNhQf6ZAshqMamICZq1Bzua4uOjY5oWwtRKhk4kJkOcinFd
 SVXPVw5bmF9gYNGp+CLJ4CS63JcsuBwxXM9acK1FyEd+PfZjVIrlOqZwVHzWUyG205qE
 zLHdeHLTzpNY9CjFQpCSDOy9AT4gjCttra+45tStnbgkNmQI9GHjdpJAEN4UJcg0htS/
 6aMoQm8FkQ/q6iEDAUfAiBp1fQg3igV/WGjSq8SH9pRMAzDNzmk/SvUqv74vXV+s+qN9
 iC9FKiB0Jcenwe03uvfdgw1oix09vdPrX10oJjjOlcJiYQzDPhOA+/u9FT6iar/Aot3/
 y1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757511831; x=1758116631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KYusx74gMgivYw43mzCgiUQelBrscv4e9WlUdU22ggg=;
 b=BgatACzIvHSitq0SFIiFMx6Iz3TOdONnd73XwRJci1oa2yl3zJsOa6QCuVGkU7+rrk
 yYImMfuDcwuDZeIcRa19RtIGVJbO9ZBpNh7kkbR/ojbX475RaP8MOMUpSwLNzIyuMrAL
 PBmcKH7i0ruFaP9T4IDD2OAgfFt0wPXvCt8380eJoRjYQ0InPa0K6R7QJpIhmlirT4kJ
 i6OlYH0GGESZKY0pqSghZf3mysvex/EpIE8yKictoNq30FAVC2eB0fvVNFU50lvXUxbf
 JF6TDbBXUZPlFWUnFr+rTYkff6FKUpFSBeUSRQumxkg3BvsPdvaDtUKcuo+Pg/NE02G5
 Jvgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXygdXJe5RAkgVNEs0ixQMt1ZSXL0ii7ilJnwa/FOlZQMVvp7WzdDmfNKDb+WeAFB7ZVdQSOCeukHTCeA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw4gLkgOd1aRfSD2JgjqkXz8pPOFo5YZGckwf0EFJSv+2YyVp/g
 S0ulXZTRk+nU9lVIDZyV29huB4D3zmfh3EFPUVWzDuMFeIm62Md8uFqjCBlza7DGKCGHwIN/xeD
 DM9Bddgp/JhWbD26lefPQj2jvqsdIFrku+Oqn9NXrSg==
X-Gm-Gg: ASbGncvu6iu/ZNgARfQO0WG9monzsric9OWyWU4Awo2jyLqanjOHtcZvzIsk7UBiLRk
 T6drcIMY0OoI6Ck0FwlS0/CA8ztPkq91ONYN34nfBmyju9OPTrXNEUA+oA9kF7vOPN1neObJL8I
 KJyVY7i3EsUM9t1HvBjJ4exK3CUzSYAfmwrrQ6MijykgiTx0z5VHIir74UILde8kMHyOqsuRzho
 g3+/8QGHTuqkNwlnyGy7I8q59okp/hvCh4ToP0=
X-Google-Smtp-Source: AGHT+IFm09bgx/eETS+zxh47Y2IF1gRYf9rbRYIHHMrehDx0L8qn2Ht4Uw5vNEiZ6L2mWS3ck3SpU2dCp6qBpa01PJo=
X-Received: by 2002:a2e:be0e:0:b0:337:f57a:6844 with SMTP id
 38308e7fff4ca-33b5a3fdaa8mr43894421fa.43.1757511830680; Wed, 10 Sep 2025
 06:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
In-Reply-To: <175751081352.3667912.274641295097354228.robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:43:38 +0200
X-Gm-Features: Ac12FXyZX2mI5u5h6corBWI5JwEw3xwlMcAzjYN5jnXKYMZIVsaIzZH2ILMwq1U
Message-ID: <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMzozOOKAr1BNIFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4KPiBPbiBXZWQsIDEwIFNlcCAyMDI1IDEwOjA3OjM5ICsw
MjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IERlc2NyaWJlIHRo
ZSBmaXJtd2FyZS1tYW5hZ2VkIHZhcmlhbnQgb2YgdGhlIFFDb20gRGVzaWduV2FyZSBNQUMuIEFz
IHRoZQo+ID4gcHJvcGVydGllcyBoZXJlIGRpZmZlciBhIGxvdCBmcm9tIHRoZSBITE9TLW1hbmFn
ZWQgdmFyaWFudCwgbGV0cyBwdXQgaXQKPiA+IGluIGEgc2VwYXJhdGUgZmlsZS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxp
bmFyby5vcmc+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcWNvbSxl
dGhxb3Mtc2NtaS55YW1sICB8IDEwMSArKysrKysrKysrKysrKysrKysrKysKPiA+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sICAgICAgICB8ICAgNCArLQo+ID4g
IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAx
ICsKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+Cj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hl
Y2snIG9uIHlvdXIgcGF0Y2g6Cj4KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4KPiBkdHNj
aGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXct
Y2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6
bjEtZ21hYy5leGFtcGxlLmR0YjogZXRoZXJuZXRANDQwMDAwMDAgKHJlbmVzYXMscjlhMDZnMDMy
LWdtYWMpOiBwb3dlci1kb21haW5zOiBbWzQyOTQ5NjcyOTVdXSBpcyB0b28gc2hvcnQKPiAgICAg
ICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L3Jl
bmVzYXMscnpuMS1nbWFjLnlhbWwjCj4gL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9s
aW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1n
bWFjLmV4YW1wbGUuZHRiOiBldGhlcm5ldEA0NDAwMDAwMCAocmVuZXNhcyxyOWEwNmcwMzItZ21h
Yyk6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnY2xvY2stbmFtZXMn
LCAnY2xvY2tzJywgJ2ludGVycnVwdC1uYW1lcycsICdpbnRlcnJ1cHRzJywgJ3BoeS1tb2RlJywg
J3Bvd2VyLWRvbWFpbnMnLCAncmVnJywgJ3J4LWZpZm8tZGVwdGgnLCAnc25wcyxtdWx0aWNhc3Qt
ZmlsdGVyLWJpbnMnLCAnc25wcyxwZXJmZWN0LWZpbHRlci1lbnRyaWVzJywgJ3R4LWZpZm8tZGVw
dGgnIHdlcmUgdW5leHBlY3RlZCkKPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwjCj4gL2J1aWxk
cy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1nbWFjLmV4YW1wbGUuZHRiOiBldGhlcm5ldEA0NDAw
MDAwMCAocmVuZXNhcyxyOWEwNmcwMzItZ21hYyk6IHBvd2VyLWRvbWFpbnM6IFtbNDI5NDk2NzI5
NV1dIGlzIHRvbyBzaG9ydAo+ICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9uZXQvc25wcyxkd21hYy55YW1sIwo+IC9idWlsZHMvcm9iaGVycmlu
Zy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9tZWRpYXRlay1kd21hYy5leGFtcGxlLmR0YjogZXRoZXJuZXRAMTEwMWMwMDAgKG1lZGlhdGVr
LG10MjcxMi1nbWFjKTogcG93ZXItZG9tYWluczogW1s0Mjk0OTY3Mjk1LCA0XV0gaXMgdG9vIHNo
b3J0Cj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL25ldC9tZWRpYXRlay1kd21hYy55YW1sIwo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZp
ZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRl
ay1kd21hYy5leGFtcGxlLmR0YjogZXRoZXJuZXRAMTEwMWMwMDAgKG1lZGlhdGVrLG10MjcxMi1n
bWFjKTogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdtYWMtYWRkcmVz
cycsICdwaHktbW9kZScsICdyZWcnLCAnc25wcyxyZXNldC1kZWxheXMtdXMnLCAnc25wcyxyZXNl
dC1ncGlvJywgJ3NucHMscnhwYmwnLCAnc25wcyx0eHBibCcgd2VyZSB1bmV4cGVjdGVkKQo+ICAg
ICAgICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9uZXQv
bWVkaWF0ZWstZHdtYWMueWFtbCMKPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xp
bnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbWVkaWF0ZWstZHdtYWMu
ZXhhbXBsZS5kdGI6IGV0aGVybmV0QDExMDFjMDAwIChtZWRpYXRlayxtdDI3MTItZ21hYyk6IHBv
d2VyLWRvbWFpbnM6IFtbNDI5NDk2NzI5NSwgNF1dIGlzIHRvbyBzaG9ydAo+ICAgICAgICAgZnJv
bSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9uZXQvc25wcyxkd21h
Yy55YW1sIwo+CgpUaGVzZSBzZWVtIHRvIGJlIGEgZmFsc2UtcG9zaXRpdmVzIHRyaWdnZXJlZCBi
eSBtb2RpZnlpbmcgdGhlCmhpZ2gtbGV2ZWwgc25wcy5kd21hYy55YW1sIGZpbGU/CgpCYXJ0Cgo+
IGRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6Cj4KPiBTZWUgaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGluZ3MvcGF0Y2gv
MjAyNTA5MTAtcWNvbS1zYTgyNTVwLWVtYWMtdjEtMi0zMmE3OWNmMWU2NjhAbGluYXJvLm9yZwo+
Cj4gVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBB
IGRpZmZlcmVudCBkZXBlbmRlbmN5Cj4gc2hvdWxkIGJlIG5vdGVkIGluICp0aGlzKiBwYXRjaC4K
Pgo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0
IHNlZSB0aGUgYWJvdmUKPiBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUgJ3lhbWxsaW50JyBpcyBp
bnN0YWxsZWQgYW5kIGR0LXNjaGVtYSBpcyB1cCB0bwo+IGRhdGU6Cj4KPiBwaXAzIGluc3RhbGwg
ZHRzY2hlbWEgLS11cGdyYWRlCj4KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBy
dW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlCj4gdGhhdCBEVF9TQ0hFTUFf
RklMRVMgY2FuIGJlIHNldCB0byB5b3VyIHNjaGVtYSBmaWxlIHRvIHNwZWVkIHVwIGNoZWNraW5n
Cj4geW91ciBzY2hlbWEuIEhvd2V2ZXIsIGl0IG11c3QgYmUgdW5zZXQgdG8gdGVzdCBhbGwgZXhh
bXBsZXMgd2l0aCB5b3VyIHNjaGVtYS4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
