Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D97826F4D51
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 01:02:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E316C6A5FD;
	Tue,  2 May 2023 23:02:49 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE9DAC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 23:02:47 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-75131c2997bso37715585a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 May 2023 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683068567; x=1685660567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RVUCe/5y2Ex7bNIQOvHne7x9R8A0wELwbdEse2WDpF8=;
 b=iHBlY9kIRMOF3Yq8hT/HYtLwTwjoof0FVfaEhNjRSWPoYgoA1qtRUzGwD+nkjOzJPI
 u09FXpbJrjxtM3MFyzM74JfHNsb7UZ0GJze/A7Ip/HD+5roEWeYmZwjlYu0a2cdkfbwf
 +kLbPvAmDmxad5KujOjWnyiCW+W4okHTLQRqn4fLYSw7t/qXPwhwMm5mWSJxb8hi+d0O
 ev3gtx0+XlazA6w82yl+mnLoL1jpad70ZxSgOz1YQXa9W1BLk0lheCYSgecLnoqpXxAH
 /k0Y7rMrxmhfNEQZTdJyCemWb5DMYD7STFJO05Jiqj2/50xWs6TXP7C2X1ywzoueu5sn
 IGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683068567; x=1685660567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RVUCe/5y2Ex7bNIQOvHne7x9R8A0wELwbdEse2WDpF8=;
 b=hFhVqx5aOq8FZopUlg1ridfuE/Ff2Xjez/BgxV4HNofic+d0rIfc+BxpOHDpBBkvai
 SC8a5r7668X8c8O7kFjBwqVOlkbEfX6iCegEMx+xiX6OVYBZFiihp5AopYTkTICrwPOt
 Pc7ZZJZM5XDCpDb6ag4IefJQ1PiX/tGOWkhTru9fNNf1u9HuaqwFJW0TCFX5WXQ62uXS
 jUfEayW/vD99YHHLsIYG/YPmwv5jJKUz73k5vhlXGRhUvbl5y+8xWOyMmXHdZ9gIHmXP
 9miduFVEQ/ItPLsHQ8LcjIirMfp4I5nDPha5IAKshsVoe65F+gzX0Yt3H2KtHLQ/sz15
 0x6g==
X-Gm-Message-State: AC+VfDzV9haI4MSgXKLvX0GvouM6Euf5gUPx9RT2/XYzlU87Jbw2P+jI
 TbLPZF88Mjy9c9zOVIghKv8=
X-Google-Smtp-Source: ACHHUZ4eSB1jw2dhw1LAIzPe/MR5kdc4AoCnBVEG18379hjnfMdu0BtdA7D5r0jmXaGKb3nbIbuwpA==
X-Received: by 2002:a05:6214:d64:b0:61a:96d3:bd20 with SMTP id
 4-20020a0562140d6400b0061a96d3bd20mr380920qvs.10.1683068566677; 
 Tue, 02 May 2023 16:02:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 t18-20020a0cea32000000b0061b71220644sm326246qvp.19.2023.05.02.16.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 16:02:45 -0700 (PDT)
Message-ID: <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
Date: Tue, 2 May 2023 16:02:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

T24gNS8yLzIzIDEyOjQwLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBUdWUsIE1heSAyLCAyMDIz
IGF0IDM6MTXigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPj4KPj4g
T24gVHVlLCBBcHIgMjUsIDIwMjMsIGF0IDE3OjU3LCBSb2IgSGVycmluZyB3cm90ZToKPj4+IE9u
IFR1ZSwgQXByIDI1LCAyMDIzIGF0IDI6MjjigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPj4+Cj4+Pj4gRG9lcyB5b3VyIHNjcmlwdCBhbHNvIGNh
dGVyIGZvciAuZHRzIGZpbGVzIG5vdCBtYXRjaGluZyBhbnkgcGF0dGVybiwKPj4+PiBidXQgaW5j
bHVkaW5nIGEgLmR0c2kgZmlsZSB0aGF0IGRvZXMgbWF0Y2ggYSBwYXR0ZXJuPwo+Pj4KPj4+IEkg
YXNzdW1lIEkgYnVpbHQgZXZlcnl0aGluZyBhZnRlciBtb3ZpbmcsIGJ1dCBtYXliZSBub3QuLi4K
Pj4+Cj4+PiBUaGF0J3MgYWxsIGp1c3QgImRldGFpbHMiLiBGaXJzdCwgd2UgbmVlZCBhZ3JlZW1l
bnQgb24gYSkgbW92aW5nCj4+PiB0aGluZ3MgdG8gc3ViZGlycyBhbmQgYikgZG9pbmcgaXQgMS1i
eS0xIG9yIGFsbCBhdCBvbmNlLiBTbyBmYXIgd2UndmUKPj4+IGJlZW4gc3R1Y2sgb24gYSkgZm9y
IGJlaW5nICd0b28gbXVjaCBjaHVybicuCj4+Cj4+IFNvcnJ5IGZvciBtaXNzaW5nIG1vc3Qgb2Yg
dGhlIGRpc2N1c3Npb24gbGFzdCB3ZWVrLiBUaGUgc2NyaXB0IHNvdW5kcwo+PiBmaW5lIHRvIG1l
LCB0aGUgb25seSByZWFzb24gSSBkaWRuJ3Qgd2FudCB0byBkbyB0aGlzIGluIHRoZSBwYXN0IGlz
IHRoYXQKPj4gd2UgaGFkIHRoZSBwbGFuIHRvIG1vdmUgcGxhdGZvcm1zIG91dCBvZiB0aGUga2Vy
bmVsIHRyZWUgdG8gYW4gZXh0ZXJuYWwKPj4gcmVwb3NpdG9yeSBhbmQgSSB3YW50ZWQgdG8gZG8g
dGhpcyBwbGF0Zm9ybSBhdCBhIHRpbWUgYW5kIGFsc28gb25seSBtb3ZlCj4+IGVhY2ggb25lIG9u
Y2UuIEkgZG9uJ3QgdGhpbmsgdGhhdCBpcyBnb2luZyB0byBoYXBwZW4gYW55dGltZSBzb29uIG5v
dywKPj4gc28gbGV0J3MganVzdCBkbyB5b3VyIHNjcmlwdC4KPj4KPj4gQ2FuIHlvdSBzZW5kIG1l
IHRoZSBzY3JpcHQgYW5kL29yIGEgcHVsbCByZXF1ZXN0IG9mIHRoZSByZXN1bHRpbmcKPj4gdHJl
ZSBiYXNlZCBvbiBteSBzb2MvZHQgYnJhbmNoPyBFdmVyeXRoaW5nIGlzIG1lcmdlZCB1cHN0cmVh
bSwKPj4gYW5kIEkgdGhpbmsgZ2l0LW1lcmdlIHdvdWxkIGhhbmRsZSB0aGUgcmVtYWluaW5nIG1l
cmdlcyB3aXRoIGFueQo+PiBvdGhlciBjaGFuZ2VzIGluIG1haW5saW5lLgo+IAo+IEkndmUgZHVz
dGVkIG9mZiBteSBzY3JpcHQgYW5kIG1hZGUgYSBicmFuY2hbMV0gd2l0aCB0aGUgcmVzdWx0Lgo+
IFRoZXJlJ3MganVzdCBhIGNvdXBsZSBvZiBmaXhlcyBuZWVkZWQgYWZ0ZXIgdGhlIHNjcmlwdCBp
cyBydW4gKHNlZSB0aGUKPiB0b3AgY29tbWl0KS4gVGhlIGNyb3NzIGFyY2ggaW5jbHVkZXMgYXJl
IGFsbCBmaXhlZCB1cCBieSB0aGUgc2NyaXB0Lgo+IGR0YnNfaW5zdGFsbCBtYWludGFpbnMgYSBm
bGF0IGluc3RhbGwuIEkgY29tcGFyZWQgdGhlIG51bWJlciBvZiAuZHRicwo+IGJlZm9yZSBhbmQg
YWZ0ZXIgdG8gY2hlY2sgdGhlIHNjcmlwdC4KPiAKPiBJIHRoaW5rIHRoZSBvbmx5IGlzc3VlIHJl
bWFpbmluZyBpcyBmaW5hbGl6aW5nIHRoZSBtYXBwaW5nIG9mCj4gcGxhdGZvcm1zIHRvIHN1YmRp
cnMuIFdoYXQgSSBoYXZlIGN1cnJlbnRseSBpcyBhIG1peHR1cmUgb2YgU29DCj4gZmFtaWxpZXMg
YW5kIHZlbmRvcnMuIFRoZSBtb3N0IG5vdGFibGUgYXJlIGFsbCB0aGUgRnJlZXNjYWxlL05YUAo+
IHBsYXRmb3JtcywgcHhhLCBzb2NmcGdhLCBhbmQgc3RtMzIuIEl0J3Mgbm90IGNvbnNpc3RlbnQg
d2l0aCBhcm02NAo+IGVpdGhlci4gT25jZSB0aGF0J3MgZmluYWxpemVkLCBJIHN0aWxsIG5lZWQg
dG8gZ28gdXBkYXRlIE1BSU5UQUlORVJTLgo+IAo+IEhlcmUncyB0aGUgY3VycmVudCBtYXBwaW5n
Ogo+IAo+IHZlbmRvcl9tYXAgPSB7Cj4gICAgICAnYWxwaGFzY2FsZScgOiAnYWxwaGFzY2FsZScs
Cj4gICAgICAnYWxwaW5lJyA6ICdhbHBpbmUnLAo+ICAgICAgJ2FydHBlYycgOiAnYXhpcycsCj4g
ICAgICAnYXhtJyA6ICdsc2knLAo+ICAgICAgJ2N4OScgOiAnY254dCcsCj4gICAgICAnZWN4JyA6
ICdjYWx4ZWRhJywKPiAgICAgICdoaWdoYmFuaycgOiAnY2FseGVkYScsCj4gICAgICAnZXA3JyA6
ICdjaXJydXMnLAo+ICAgICAgJ214cyc6ICdteHMnLAo+ICAgICAgJ2lteDIzJzogJ214cycsCj4g
ICAgICAnaW14MjgnOiAnbXhzJywKPiAgICAgICdzdW4nIDogJ2FsbHdpbm5lcicsCj4gICAgICAn
aW14JzogJ2lteCcsCj4gICAgICAnZTYnIDogJ2lteCcsCj4gICAgICAnZTcnIDogJ2lteCcsCj4g
ICAgICAnbWJhNicgOiAnaW14JywKPiAgICAgICdscyc6ICdmc2wnLAo+ICAgICAgJ3ZmJzogJ2Zz
bCcsCj4gICAgICAncWNvbSc6ICdxY29tJywKPiAgICAgICdhbTMnIDogJ3RpJywKPiAgICAgICdh
bTQnIDogJ3RpJywKPiAgICAgICdhbTUnIDogJ3RpJywKPiAgICAgICdkcmEnIDogJ3RpJywKPiAg
ICAgICdrZXlzdG9uZScgOiAndGknLAo+ICAgICAgJ29tYXAnIDogJ3RpJywKPiAgICAgICdjb21w
dWxhYicgOiAndGknLAo+ICAgICAgJ2xvZ2ljcGQnIDogJ3RpJywKPiAgICAgICdlbHBpZGEnIDog
J3RpJywKPiAgICAgICdtb3Rvcm9sYScgOiAndGknLAo+ICAgICAgJ3R3bCcgOiAndGknLAo+ICAg
ICAgJ2RhJyA6ICd0aScsCj4gICAgICAnZG0nIDogJ3RpJywKPiAgICAgICduc3BpcmUnIDogJ25z
cGlyZScsCj4gICAgICAnYXJtYWRhJyA6ICdtYXJ2ZWxsJywKPiAgICAgICdkb3ZlJyA6ICdtYXJ2
ZWxsJywKPiAgICAgICdraXJrd29vZCcgOiAnbWFydmVsbCcsCj4gICAgICAnb3Jpb24nIDogJ21h
cnZlbGwnLAo+ICAgICAgJ212ZWJ1JyA6ICdtYXJ2ZWxsJywKPiAgICAgICdtbXAnIDogJ21hcnZl
bGwnLAo+ICAgICAgJ2JlcmxpbicgOiAnYmVybGluJywKPiAgICAgICdweGEyJyA6ICdweGEnLAo+
ICAgICAgJ3B4YTMnIDogJ3B4YScsCj4gICAgICAncHhhJyA6ICdtYXJ2ZWxsJywKPiAgICAgICdh
cm0tJyA6ICdhcm0nLAo+ICAgICAgJ2ludGVnJyA6ICdhcm0nLAo+ICAgICAgJ21wcycgOiAnYXJt
JywKPiAgICAgICd2ZScgOiAnYXJtJywKPiAgICAgICdhc3BlZWQnIDogJ2FzcGVlZCcsCj4gICAg
ICAnYXN0MicgOiAnYXNwZWVkJywKPiAgICAgICdmYWNlYm9vaycgOiAnYXNwZWVkJywKPiAgICAg
ICdpYm0nIDogJ2FzcGVlZCcsCj4gICAgICAnb3BlbmJtYycgOiAnYXNwZWVkJywKPiAgICAgICdl
bjcnIDogJ2Fpcm9oYScsCj4gICAgICAnYXQ5MScgOiAnbWljcm9jaGlwJywKPiAgICAgICdzYW1h
JyA6ICdtaWNyb2NoaXAnLAo+ICAgICAgJ3NhbTknIDogJ21pY3JvY2hpcCcsCj4gICAgICAndXNi
XycgOiAnbWljcm9jaGlwJywKPiAgICAgICd0bnlfJyA6ICdtaWNyb2NoaXAnLAo+ICAgICAgJ21w
YTE2MDAnIDogJ21pY3JvY2hpcCcsCj4gICAgICAnYW5pbWVvX2lwJyA6ICdtaWNyb2NoaXAnLAo+
ICAgICAgJ2Frcy1jZHUnIDogJ21pY3JvY2hpcCcsCj4gICAgICAnZXRoZXJudXQ1JyA6ICdtaWNy
b2NoaXAnLAo+ICAgICAgJ2V2ay1wcm8zJyA6ICdtaWNyb2NoaXAnLAo+ICAgICAgJ3BtOWc0NScg
OiAnbWljcm9jaGlwJywKPiAgICAgICdnZTg2JyA6ICdtaWNyb2NoaXAnLAo+ICAgICAgJ2JjbScg
OiAnYnJjbScsCgpIb3cgYWJvdXQgd2UgdXNlICdicm9hZGNvbScgaGVyZSwgdG8gZm9sbG93IHdo
YXQgYXJtNjQgZG9lcz8gSSBjb3VsZCAKcmVuYW1lIGFyY2gvbWlwcy9ib290L2R0cy9icmNtIHRv
IGFyY2gvbWlwcy9ib290L2R0cy9icm9hZGNvbSBmb3IgCmNvbnNpc3RlbmN5LCB0b28/Ci0tIApG
bG9yaWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
