Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7876065B5
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Oct 2022 18:26:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C1D3C64106;
	Thu, 20 Oct 2022 16:26:08 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 272E0C55596
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Oct 2022 16:26:07 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id h13so25549pfr.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Oct 2022 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xum5Fxe9AHNv8x3jeO0ua5UOPilk3X0ghZ8I9RqOHTs=;
 b=hbWHR1HEawD7XtdFmZrKeaKl/v4GcttXjikNzVXoHH/YPBGSWYRkjpB964yqPOwBeF
 C1T3ueLAGlWHhzC3oujpOwYtg6MahUk9or7tOAQT9XH4MOZCsAggviEFiaTzVfz9xHyo
 wJcP/f2AZk5sJ3v+6FleS+yY5ij0upeuWQcCNCNRnvPAlPnktORCeRpVqbOl0/+C5GZL
 kLFO1TqgjtMnZzv7KBz+4JRgS0AyAeDn84LFj453vmPfIsOFe2HLUerTvkCbxTNug6k3
 EZbFdYLbfotRKj6d6yNtsBDoMo3TINNBWxJR2FT/2hxWZofm4q4D4MR2CrEcK82J3vWk
 icFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xum5Fxe9AHNv8x3jeO0ua5UOPilk3X0ghZ8I9RqOHTs=;
 b=J7x0uMcuLj61DWhdbxD1lJFUoggDNfO5JAzRK6j8dc10y/sw6RFcesVlibF+n3fRvv
 Bm2C07Dj+3ahtBxOV1QT1YHKx7MjCEdY8Aiqf7PyVGYxyLj3aqF9Go9X3dvVk9s3Souw
 +jIPfSjlNuexqYKrYlr2nALMv1k4UTTnbQiXx5keDg3GKpstTG3DAaRAaxykNSCbIojb
 KYqWVwOlpALQRPwI/1xOJCW/3jUchF5Jf/Pt+/E3UYybZMqvQlqI+UQ54L4v9nS/jTLi
 omPwixpCmvZ7/7zpnNbHEgrjsBrcyC8a4Fg3O84NcCLrTc00Ob0+zTqp/dx+nOzLUqWC
 A96Q==
X-Gm-Message-State: ACrzQf0yvP4brslgoHbN0ft6aPmL4SCsI01Cn33rB2UUIZRnNbF1ikYs
 iPRsZvCXDcJTfpGCEKZr0Txg
X-Google-Smtp-Source: AMsMyM7VUxiWlAgYM67rKqYZ2XLZYmKi0KFeeTUuJQVcBw3KrezJsDsFuidrzxeoo5tmjUaDBwAPcA==
X-Received: by 2002:a63:d613:0:b0:45a:654:cf16 with SMTP id
 q19-20020a63d613000000b0045a0654cf16mr12471440pgg.611.1666283165608; 
 Thu, 20 Oct 2022 09:26:05 -0700 (PDT)
Received: from thinkpad ([117.193.215.105]) by smtp.gmail.com with ESMTPSA id
 jc11-20020a17090325cb00b00174f61a7d09sm2382030plb.247.2022.10.20.09.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 09:26:04 -0700 (PDT)
Date: Thu, 20 Oct 2022 21:55:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20221020162557.GA5502@thinkpad>
References: <20220923023745.272076-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220923023745.272076-1-marex@denx.de>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Drop stm32mp15xc.dtsi
	from Avenger96
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

T24gRnJpLCBTZXAgMjMsIDIwMjIgYXQgMDQ6Mzc6NDVBTSArMDIwMCwgTWFyZWsgVmFzdXQgd3Jv
dGU6Cj4gVGhlIEF2ZW5nZXI5NiBpcyBwb3B1bGF0ZWQgd2l0aCBTVE0zMk1QMTU3QSBESENPUiBT
b00sIGRyb3AgdGhlCj4gc3RtMzJtcDE1eGMuZHRzaSB3aGljaCBzaG91bGQgb25seSBiZSBpbmNs
dWRlZCBpbiBEVHMgb2YgZGV2aWNlcwo+IHdoaWNoIGFyZSBwb3B1bGF0ZWQgd2l0aCBTVE0zMk1Q
MTV4Qy9GIFNvQyBhcyB0aGUgc3RtMzJtcDE1eGMuZHRzaQo+IGVuYWJsZXMgQ1JZUCBibG9jayBu
b3QgcHJlc2VudCBpbiB0aGUgU1RNMzJNUDE1eEEvRCBTb0MgLgo+IAo+IEZpeGVzOiA3ZTc2Zjgy
YWNkOWUxICgiQVJNOiBkdHM6IHN0bTMyOiBTcGxpdCBBdmVuZ2VyOTYgaW50byBESENPUiBTb00g
YW5kIEF2ZW5nZXI5NiBib2FyZCIpCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4
QGRlbnguZGU+CgpSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFu
LnNhZGhhc2l2YW1AbGluYXJvLm9yZz4KClRoYW5rcywKTWFuaQoKPiAtLS0KPiBDYzogQWxleGFu
ZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPiBDYzogTWFuaXZhbm5h
biBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4KPiBDYzogUGF0
cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gQ2M6IFBhdHJpY2sg
RGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gQ2M6IGxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBUbzogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gLS0tCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRo
Y29yLWF2ZW5nZXI5Ni5kdHMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtZGhjb3ItYXZl
bmdlcjk2LmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRoY29yLWF2ZW5nZXI5
Ni5kdHMKPiBpbmRleCAyZTNjOWZiYjRlYjM2Li4yNzUxNjdmMjZmZDlkIDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRoY29yLWF2ZW5nZXI5Ni5kdHMKPiArKysg
Yi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kaGNvci1hdmVuZ2VyOTYuZHRzCj4gQEAg
LTEzLDcgKzEzLDYgQEAKPiAgL2R0cy12MS87Cj4gIAo+ICAjaW5jbHVkZSAic3RtMzJtcDE1Ny5k
dHNpIgo+IC0jaW5jbHVkZSAic3RtMzJtcDE1eGMuZHRzaSIKPiAgI2luY2x1ZGUgInN0bTMybXAx
NXh4LWRoY29yLXNvbS5kdHNpIgo+ICAjaW5jbHVkZSAic3RtMzJtcDE1eHgtZGhjb3ItYXZlbmdl
cjk2LmR0c2kiCj4gIAo+IC0tIAo+IDIuMzUuMQo+IAoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCu
o+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
