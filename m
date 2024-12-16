Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F02B9F359C
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2024 17:17:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A16B7C7129D;
	Mon, 16 Dec 2024 16:17:16 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64EFDC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 16:17:09 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-725ee27e905so5615687b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 08:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734365828; x=1734970628;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=82gDKALWw0Ekg/l8MKhauenkjup0NAxqqSYjA8q5Flo=;
 b=rR7kMpKN4et/uuG2BLBqDoBYBsx8OBylbOIAYOd0Y4baFyLSnO3u0RXPhUFO3GpA4t
 K4SCKI9g8GVZMaCvE1pEkvJxwZKBvKAsZQpIzxLZ/iAShY8JuK7YWK7ORmwAFaZ86THj
 v6BZfu4oM7LCsrzKzMxs4Bu7IjA8oixgVngTDPzVYJ30RSwihUizu8vwRxcyTFCJ2nMl
 y+7rmWdYEwbV3VR+5P7/shj/d9Lma0lXV6ye7V019LzP8pHd+g0Z3uUAL45FZTsj048M
 94216qCl7Sg9vEhCar37BfVIfqF+Q1hu5CH+VkCoeG5z7pBF6kZoCpPeUVLMAsvYSq02
 8QHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734365828; x=1734970628;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=82gDKALWw0Ekg/l8MKhauenkjup0NAxqqSYjA8q5Flo=;
 b=djEeLxyLL55tlQS//AHET8N4Xh+3fMCgR+NVx2HehSX3M4MOsF3TGBjxhJaHCY0MuH
 O9wz2g2WUdn4EhkwCfR1uMMfzlMRki/33De5dvkSB5KjWbfl8WH4hono2nTkEEW6IyFC
 f7mzB7zn5QfY4rW0L0nwHBl745KfGIDt56VW8asi5PomVyzncuI4Ru+MNWs7dFO3txZR
 Xc0XQX32zmmcLBR2fCnP0909F+ae774AByNOxxt7L8gu35bAPiR+9XiZn0MAstHwFZJu
 3KC3Nq5TXyAE54vJS16VkSWllMwH+tOJCA72BCmaU+03fRjGgnGjjkB3MpU33ag16KWD
 ZCZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9U5/Tz5W3B4iSmo/nYrKN9N5nNb42lXKHpZJiEotFGATqSHV5Kkr+x8CWqysRBeYEFs/LHt4bgplOBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzWCd/Vrr3RCFUeBQ93h2TK8bOSN7SkB1DgvgxQHGNdwxRgoH7S
 sBn5aHAakjD2CocEcgOqyhWHUR4hMWylMdaetDE9L+oJmtRPc1c/WPtj3gIElg==
X-Gm-Gg: ASbGncuSnwaZK3NA/Pyk+U5PMuDEEue2A2rDO5jU6IVqV94IqB/iBEeezgqZD1FhmMy
 y79ABLEvtpLoRXz6Ue3VUpS3E+3sFXBdAQgcfjluyysIZsmd92HHs4u8yeFNf713HIhH72PlaCV
 nYAHM5m4P4OVN9gi2oidCPlUri/Nglbs37gYoeyNimM05MHEQT7GDebRAePbIHqgJrwo6qXwMKX
 lklMz7ANw8CHK8jHIu+nnwjgid5oKQxZxDhusAjuw0031m4Z9DjEivnhEhWKdnWaOhM
X-Google-Smtp-Source: AGHT+IGvG6qXEoCqCkROvX+b6dhtMyqPUbkI3UVWtmJgHt1xZMsm2fyfByqDiqxFQpxzhlW12Qg/Wg==
X-Received: by 2002:a05:6a00:3688:b0:729:35b:542e with SMTP id
 d2e1a72fcca58-7290c25a4bcmr16844563b3a.16.1734365827870; 
 Mon, 16 Dec 2024 08:17:07 -0800 (PST)
Received: from thinkpad ([120.56.200.168]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918bb3a6dsm4925657b3a.136.2024.12.16.08.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 08:17:07 -0800 (PST)
Date: Mon, 16 Dec 2024 21:47:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20241216161700.dtldi7fari6kafrr@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-5-christian.bruel@foss.st.com>
 <20241203152230.5mdrt27u5u5ecwcz@thinkpad>
 <4e257489-4d90-4e47-a4d9-a2444627c356@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e257489-4d90-4e47-a4d9-a2444627c356@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint
 support for STM32MP25
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

T24gTW9uLCBEZWMgMTYsIDIwMjQgYXQgMTE6MDI6MDdBTSArMDEwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IEhpIE1hbml2YW5uYSwKPiAKPiBPbiAxMi8zLzI0IDE2OjIyLCBNYW5pdmFubmFu
IFNhZGhhc2l2YW0gd3JvdGU6Cj4gPiBPbiBUdWUsIE5vdiAyNiwgMjAyNCBhdCAwNDo1MToxOFBN
ICswMTAwLCBDaHJpc3RpYW4gQnJ1ZWwgd3JvdGU6Cj4gPiAKPiA+IFsuLi5dCj4gPiAKPiA+ID4g
K3N0YXRpYyBpbnQgc3RtMzJfcGNpZV9zdGFydF9saW5rKHN0cnVjdCBkd19wY2llICpwY2kpCj4g
PiA+ICt7Cj4gPiA+ICsJc3RydWN0IHN0bTMyX3BjaWUgKnN0bTMyX3BjaWUgPSB0b19zdG0zMl9w
Y2llKHBjaSk7Cj4gPiA+ICsJaW50IHJldDsKPiA+ID4gKwo+ID4gPiArCWlmIChzdG0zMl9wY2ll
LT5saW5rX3N0YXR1cyA9PSBTVE0zMl9QQ0lFX0VQX0xJTktfRU5BQkxFRCkgewo+ID4gPiArCQlk
ZXZfZGJnKHBjaS0+ZGV2LCAiTGluayBpcyBhbHJlYWR5IGVuYWJsZWRcbiIpOwo+ID4gPiArCQly
ZXR1cm4gMDsKPiA+ID4gKwl9Cj4gPiA+ICsKPiA+ID4gKwlyZXQgPSBzdG0zMl9wY2llX2VuYWJs
ZV9saW5rKHBjaSk7Cj4gPiA+ICsJaWYgKHJldCkgewo+ID4gPiArCQlkZXZfZXJyKHBjaS0+ZGV2
LCAiUENJZSBjYW5ub3QgZXN0YWJsaXNoIGxpbms6ICVkXG4iLCByZXQpOwo+ID4gPiArCQlyZXR1
cm4gcmV0Owo+ID4gPiArCX0KPiA+IAo+ID4gSG93IHRoZSBSRUZDTEsgaXMgc3VwcGxpZWQgdG8g
dGhlIGVuZHBvaW50PyBGcm9tIGhvc3Qgb3IgZ2VuZXJhdGVkIGxvY2FsbHk/Cj4gCj4gRnJvbSBI
b3N0IG9ubHksIHdlIGRvbid0IHN1cHBvcnQgdGhlIHNlcGFyYXRlZCBjbG9jayBtb2RlbC4KPiAK
Ck9LLiBTbyBldmVuIHdpdGhvdXQgcmVmY2xrIHlvdSBhcmUgc3RpbGwgYWJsZSB0byBhY2Nlc3Mg
dGhlIGNvbnRyb2xsZXIKcmVnaXN0ZXJzPyBTbyB0aGUgY29udHJvbGxlciBDU1JzIHNob3VsZCBi
ZSBhY2Nlc3NpYmxlIGJ5IHNlcGFyYXRlIGxvY2FsIGNsb2NrIEkKYmVsaWV2ZS4KCkFueWhvdywg
cGxlYXNlIGFkZCB0aGlzIGxpbWl0YXRpb24gKHJlZmNsayBkZXBlbmRlbmN5IGZyb20gaG9zdCkg
aW4gY29tbWl0Cm1lc3NhZ2UuCgpbLi4uXQoKPiA+ID4gKwlyZXQgPSBwaHlfc2V0X21vZGUoc3Rt
MzJfcGNpZS0+cGh5LCBQSFlfTU9ERV9QQ0lFKTsKPiA+IAo+ID4gSG1tLCBzbyBQSFkgbW9kZSBp
cyBjb21tb24gZm9yIGJvdGggZW5kcG9pbnQgYW5kIGhvc3Q/Cj4gCj4gWWVzIGl0IGlzLiBXZSBu
ZWVkIHRvIGluaXQgdGhlIHBoeSBoZXJlIGJlY2F1c2UgaXQgaXMgYSBjbG9jayBzb3VyY2UgZm9y
IHRoZQo+IFBDSWUgY29yZSBjbGsKPiAKCkNsb2NrIHNvdXJjZT8gSXMgaXQgY29taW5nIGRpcmVj
dGx5IHRvIFBDSWUgb3IgdGhyb3VnaCBSQ0M/IFRoZXJlIGlzIG5vIGRpcmVjdApjbG9jayByZXBy
ZXNlbnRhdGlvbiBmcm9tIFBIWSB0byBQQ0llIGluIERUIGJpbmRpbmcuCgotIE1hbmkKCi0tIArg
rq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
