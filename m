Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5681AC67D5
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:55:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97321C36B30;
	Wed, 28 May 2025 10:55:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F18DBC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:55:40 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S0t6GY024736
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 28 May 2025 10:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2GBHIa4UJXy3kvJwaMsOIp36AT4ZgsNjCHuBmMnsGGw=; b=WLqBDXLaETrREYPP
 k3bqTgo4rPOev8L1bg2YP3zUKL3ZKb/ZbYk2aOckQdMkBvCDvDHTPbAK0IhR7Wjv
 12r5wFXgoAWjAYkw74SbYE+gmbpqy29x+7rpmMgEm8WCZyASVPYsO6vxBdYVsYsg
 P4+BgsYx9M5+a/I/xK+XplgbelC1Jxf365V3AIK6OTFyZpKSRusIKbJ4S4HmWsTt
 0gtsHWF3imOnvSr9sHhysmwT4MkLWmAvXSE2jGkGzbBBkuXpKVh9qjJXwo3/r3s7
 5uLyOjv1bGFclk/VO6rcG/LGayxuaz3O1JC4IIzV+UlafMX9BvVP/6bYQqL4mxuj
 X3b5uQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjt09w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:55:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c791987cf6so823917085a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748429738; x=1749034538;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2GBHIa4UJXy3kvJwaMsOIp36AT4ZgsNjCHuBmMnsGGw=;
 b=wRGOY1/eq1JWwW1wV+/ISCrsPmWt4CXDZutEDyJsnO75QX/WE+HuBvHdfeFnhrZtRi
 oNxoqG+o4kT+9Bm89LQYnKQF252is9NGu9VOWaxD4h7qLWIsCtfi3FY/mlOfGdIxkIrP
 R5kUi+x2vfFIicG5129yjns51YnYvA0/33uGK+3TbFk7p5P2lbUzBRJfFsR51czsSYrl
 dfgzMcPl2wl8tsczmTPTZYUJbOvUC/GmHczP5fdElGAzG5HYE/a53GG1Oj5e4oQAVZtr
 H8ntgvDAv84AbNOZpfBDJmjVMjmOvuNJMHLNgJnms7HmAR0S6aTlHv0o5lF/Ji8ARrcN
 pYcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+9OLHq3owNCYjTUyRIK49vtyw9++B50ij4kWYJ7FYqgoNjKm1qpfuY2T1UWbfOLAEWKdEi4gcCWBF4g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxNweE7qyN7app16Z1Ic1ZwzcXriX8pGnVFn8Qfp4hVh+55m3zn
 YsSKxqYJioF4Tp0K4L/TLK6NMqitQFiFIJj11snfgru9+JBSCG8JJ4DXoyySm4vbYAfieYIx6pj
 wBiaD5p1QcuojSvxDDoIaNUVlN8X18Ug1oosQNRO7FLL6Vuxr0W7yi9LnFcPvRDDslTQV+122Ji
 MqeOc3ZSU=
X-Gm-Gg: ASbGncsi/SIFXN2pb/wb6kK6kDZwQFYHHtuU4S6k76aVZZGSkSNz+tzpe6Ecm47h8gu
 LZqvLrTZsGhnCmLzY10iHFJBMB+bz+W4FHeIqorLxUOhjftfEefsNKPK41+kN8luwr2q1o4ddwQ
 reDj7d9jc7EQXUqVQCs2BrKaYogZq9PIJXefu2qIKSctyy/PqPNSz9HGVLyUq78WWPCnGC9DWbq
 KyHOIPut8UgF2lzgFzxSg97ml9oVWLVlf28YV7ZztdZ3lrYVIx5WtWDKsxpjIdWlgh+rl/25RDS
 1SI1Ya3ZseKHgFDrEkeA0Sj4JUZ0u2tqGAEUfr7B9iN3Afc8deGefRXUhTeueOrvDvhwHiTluws
 =
X-Received: by 2002:a05:6214:f04:b0:6f9:51b5:45b4 with SMTP id
 6a1803df08f44-6fa9d01b876mr219768096d6.12.1748429737693; 
 Wed, 28 May 2025 03:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHTeW9Oym5KrU5w2CrN6TuqbEYXZSVkhfiP2M2uzBIJxVS46ac7MVbRXMxqQkY4kvIlFReMQ==
X-Received: by 2002:a05:6214:f04:b0:6f9:51b5:45b4 with SMTP id
 6a1803df08f44-6fa9d01b876mr219767476d6.12.1748429737194; 
 Wed, 28 May 2025 03:55:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f62b2e8sm233345e87.96.2025.05.28.03.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:55:36 -0700 (PDT)
Date: Wed, 28 May 2025 13:55:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <y262e67gi5f53objugljkpyc3lzdaqtw3b7qr4546btqo7ehu4@qp2orsf6xd7t>
References: <20250528-drm-bridge-convert-to-alloc-api-v4-1-f04e698c9a77@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528-drm-bridge-convert-to-alloc-api-v4-1-f04e698c9a77@bootlin.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6836ebab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=Xa5mcPTA7YjQpW6brCsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: vCff00J6Myf3xc4JWGqoDVPIhB5zY69D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NSBTYWx0ZWRfX6O1EGbR/4qoV
 InGjJq3uwkxJFrHWXplvkSEavrzZMKl/8b4Ugij2SAvxNMU/6oRTrTEpWaY4byj3drtbTsRDMVW
 xtRpPxu8EwR7eVznu5EgBxr8YVcPoXQpOhSIkNPm6gvQdizJGh03nQkpr5nXIAqIBDKApHMPsUI
 OcK2WP/4HUVTzuy35MwFnttGEVnMl5dTDgtY6LugYhcXP6meb5uNS5GzjgdTLaKFms4q6WOM4jw
 4WKn62gzkpNDFGdCQysHZm14DvIysq6nJMsl2TXaGSYCoorxyscIiPhCFts2cWMOJyBPCN11Yy1
 Y0VhaDIUMTtiIaGt7/aijK+4HTBM9Tf1QDusstH8ZN9y2XOLoi1G9nAo0V54uFH//tNRhqfGJBV
 oNHMGxk01vpY9fhvocfK3bzdn3H+FduEyTyh5cL8o2WdTG7et5ykFFzmcKt8tylDBICTImCW
X-Proofpoint-GUID: vCff00J6Myf3xc4JWGqoDVPIhB5zY69D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280095
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4] drm/bridge: tc358767: convert to
 devm_drm_bridge_alloc() API
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMTE6Mjk6MzZBTSArMDIwMCwgTHVjYSBDZXJlc29saSB3
cm90ZToKPiBUaGlzIGlzIHRoZSBuZXcgQVBJIGZvciBhbGxvY2F0aW5nIERSTSBicmlkZ2VzLgo+
IAo+IENvbnZlcnRpbmcgdGhpcyBkcml2ZXIgaXMgYSBiaXQgY29tcGxleCBiZWNhdXNlIHRoZSBk
cm1fYnJpZGdlIGZ1bmNzCj4gcG9pbnRlciBkaWZmZXJzIGJhc2VkIG9uIHRoZSBicmlkZ2UgbW9k
ZS4gU28gdGhlIGN1cnJlbnQgY29kZSBkb2VzOgo+IAo+ICAqIHRjX3Byb2JlKCkKPiAgICAqIGRl
dm1fa3phbGxvYygpIHByaXZhdGUgc3RydWN0IGVtYmVkZGluZyBkcm1fYnJpZGdlCj4gICAgKiBj
YWxsIHRjX3Byb2JlX2JyaWRnZV9lbmRwb2ludCgpIHdoaWNoCj4gICAgICAqIHBhcnNlcyBEVCBk
ZXNjcmlwdGlvbiBpbnRvIHN0cnVjdCBmaWVsZHMKPiAgICAgICogY29tcHV0ZXMgdGhlIG1vZGUK
PiAgICAgICogY2FsbHMgZGlmZmVyZW50IGJyaWRnZSBpbml0IGZ1bmN0aW9ucyBiYXNlZCBvbiB0
aGUgbW9kZQo+ICAgICAgICAqIGVhY2ggc2V0cyBhIGRpZmZlcmVudCBicmlkZ2UuZnVuY3MgcG9p
bnRlcgo+IAo+IFRoZSBuZXcgQVBJIGV4cGVjdHMgdGhlIGZ1bmNzIHBvaW50ZXIgdG8gYmUga25v
d24gYXQgYWxsb2MgdGltZSwgd2hpY2ggZG9lcwo+IG5vdCBmaXQgaW4gdGhlIGN1cnJlbnQgY29k
ZSBzdHJ1Y3R1cmUuCj4gCj4gU29sdmUgdGhpcyBieSBzcGxpdHRpbmcgdGNfcHJvYmVfYnJpZGdl
X2VuZHBvaW50KCkgaW4gdHdvIGZ1bmN0aW9uczoKPiAKPiAgKiB0Y19wcm9iZV9nZXRfbW9kZSgp
LCBjb21wdXRpbmcgdGhlIG1vZGUgd2l0aG91dCBuZWVkaW5nIHRoZSBwcml2YXRlCj4gICAgZHJp
dmVyIHN0cnVjdHVyZQo+ICAqIHRjX3Byb2JlX2JyaWRnZV9lbmRwb2ludCgpLCBvbmx5IGluaXRp
YWxpemluZyB0aGUgZW5kcG9pbnRzCj4gCj4gU28gbm93IHRoZSBtb2RlIGlzIGtub3duIGJlZm9y
ZSBhbGxvY2F0aW9uIGFuZCBzbwo+IGlzIHRoZSBmdW5jcyBwb2ludGVyLCB3aGlsZSBhbGwgb3Ro
ZXIgb3BlcmF0aW9ucyBhcmUgc3RpbGwgaGFwcGVuaW5nIGFmdGVyCj4gYWxsb2NhdGlvbiwgZGly
ZWN0bHkgaW50byB0aGUgcHJpdmF0ZSBzdHJ1Y3QgZGF0YSwgYXMgdGhleSB1c2VkIHRvLgo+IAo+
IFRoZSBuZXcgY29kZSBmbG93IGlzOgo+IAo+ICAqIHRjX3Byb2JlKCkKPiAgICAqIHRjX3Byb2Jl
X2dldF9tb2RlKCkKPiAgICAgICogcGFyc2VzIERUIGRlc2NyaXB0aW9uCj4gICAgICAqIGNvbXB1
dGVzIGFuZCByZXR1cm5zIHRoZSBtb2RlCj4gICAgKiBiYXNlZCBvbmYgdGhlIG1vZGUsIHBpY2sg
dGhlIGZ1bmNzIHBvaW50ZXIKPiAgICAqIGRldm1fZHJtX2JyaWRmZ2VfYWxsb2MoLi4uLCBmdW5j
cykKPiAgICAqIGNhbGwgdGNfcHJvYmVfYnJpZGdlX2VuZHBvaW50KCkgd2hpY2gKPiAgICAgICog
Y2FsbHMgZGlmZmVyZW50IGJyaWRnZSBpbml0IGZ1bmN0aW9ucyBiYXNlZCBvbiB0aGUgbW9kZQo+
ICAgICAgICAqIHRoZXNlIGRvbid0IHNldCB0aGUgZnVuY3MgcG9pbnRlciwgaXQgd2FzIGRvbmUg
YnkgX2FsbG9jCj4gCj4gVGhpcyBzb2x1dGlvbiBpcyBjaG9zZW4gdG8gbWluaW1pemUgdGhlIGNo
YW5nZXMgaW4gdGhlIGRyaXZlciBsb2dpY2FsIGNvZGUKPiBmbG93LiBUaGUgZHJhd2JhY2sgaXMg
d2Ugbm93IGl0ZXJhdGUgdHdpY2Ugb3ZlciB0aGUgZW5kcG9pbnRzIGR1cmluZyBwcm9iZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29t
Pgo+IC0tLQo+IGRldm1fZHJtX2JyaWRnZV9hbGxvYygpIFswXSBpcyB0aGUgbmV3IEFQSSB0byBh
bGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSBhIERSTQo+IGJyaWRnZSwgYW5kIHRoZSBvbmx5IG9uZSBz
dXBwb3J0ZWQgZnJvbSBub3cgb24uIEl0IGlzIHRoZSBmaXJzdCBtaWxlc3RvbmUKPiB0b3dhcmRz
IHJlbW92YWwgb2YgYnJpZGdlcyBmcm9tIGEgc3RpbGwgZXhpc3RpbmcgRFJNIHBpcGVsaW5lIHdp
dGhvdXQKPiB1c2UtYWZ0ZXItZnJlZS4KPiAKPiBUaGUgc3RlcHMgaW4gdGhlIGdyYW5kIHBsYW4g
WzFdIGFyZToKPiAKPiAgMS4g4p6cIGFkZCByZWZjb3VudGluZyB0byBEUk0gYnJpZGdlcyAoc3Ry
dWN0IGRybV9icmlkZ2UpCj4gIDIuIGhhbmRsZSBncmFjZWZ1bGx5IGF0b21pYyB1cGRhdGVzIGR1
cmluZyBicmlkZ2UgcmVtb3ZhbAo+ICAzLiBhdm9pZCBEU0kgaG9zdCBkcml2ZXJzIHRvIGhhdmUg
ZGFuZ2xpbmcgcG9pbnRlcnMgdG8gRFNJIGRldmljZXMKPiAgNC4gZmluaXNoIHRoZSBob3RwbHVn
IGJyaWRnZSB3b3JrLCByZW1vdmluZyB0aGUgImFsd2F5cy1kaXNjb25uZWN0ZWQiCj4gICAgIGNv
bm5lY3RvciwgbW92aW5nIGNvZGUgdG8gdGhlIGNvcmUgYW5kIHBvdGVudGlhbGx5IHJlbW92aW5n
IHRoZQo+ICAgICBob3RwbHVnLWJyaWRnZSBpdHNlbGYgKHRoaXMgbmVlZHMgdG8gYmUgY2xhcmlm
aWVkIGFzIHBvaW50cyAxLTMgYXJlCj4gICAgIGRldmVsb3BlZCkKPiAKPiBUaGlzIHNlcmllcyBp
cyBwYXJ0IG9mIHN0ZXAgMSBvZiB0aGUgZ3JhbmQgcGxhbi4KPiAKPiBDdXJyZW50IHRhc2tzIGlu
IHN0ZXAgMSBvZiB0aGUgZ3JhbmQgcGxhbjoKPiAKPiAgQS4g4pyUIGFkZCBuZXcgYWxsb2MgQVBJ
IGFuZCByZWZjb3VudGluZyAtPiAobm93IGluIGRybS1taXNjLW5leHQpCj4gIEIuIOKenCBjb252
ZXJ0IGFsbCBicmlkZ2UgZHJpdmVycyB0byBuZXcgQVBJICh0aGlzIHNlcmllcykKPiAgQy4g4oCm
IGRvY3VtZW50YXRpb24sIGt1bml0IHRlc3RzICh2MSB1bmRlciBkaXNjdXNzaW9uKQo+ICBELiBh
ZnRlciAoQiksIGFkZCBnZXQvcHV0IHRvIGRybV9icmlkZ2VfYWRkL3JlbW92ZSgpICsgYXR0YWNo
L2RldGVjaCgpCj4gIEUuIGFmdGVyIChCKSwgY29udmVydCBhY2Nlc3NvcnM7IHRoaXMgaXMgYSBs
YXJnZSB3b3JrIGFuZCBjYW4gYmUgZG9uZQo+ICAgICBpbiBjaHVua3MKPiAgRi4gZGVidWdmcyBp
bXByb3ZlbWVudHMKPiAKPiBNb3JlIGluZm8gYWJvdXQgdGhpcyBzZXJpZXMgaW4gdGhlIHYyIGNv
dmVyIFsyXS4KPiAKPiBMdWNhCj4gCj4gWzBdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vbWlzYy9rZXJuZWwvLS9jb21taXQvMGNjNmFhZGQ3ZmMxZTYyOWI3MTVlYTNkMWJhNTM3
ZWYyZGE5NWVlYwo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwMjA2LWhv
dHBsdWctZHJtLWJyaWRnZS12Ni0wLTlkNmYyYzljMzA1OEBib290bGluLmNvbS90LyN1Cj4gWzJd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTA0MjQtZHJtLWJyaWRnZS1jb252ZXJ0
LXRvLWFsbG9jLWFwaS12Mi0wLThmOTFhNDA0ZDg2YkBib290bGluLmNvbS8KPiAtLS0KPiBDaGFu
Z2VzIGluIHY0Ogo+IC0gUmVtb3ZlZCBwYXRjaGVzIGFscmVhZHkgaW4gZHJtLW1pc2MtbmV4dCAt
PiBvbmx5IDEgbGVmdAo+IC0gSW1wcm92ZSBjb21taXQgbWVzc2FnZSBvZiBwYXRjaCAxCj4gLSBM
aW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA1MDktZHJtLWJyaWRn
ZS1jb252ZXJ0LXRvLWFsbG9jLWFwaS12My0wLWI4YmMxZjE2ZDdhYUBib290bGluLmNvbS8KPiAK
PiBDaGFuZ2VzIGluIHYzOgo+IC0gRml4ZWQgaXNzdWVzIHJlcG9ydGVkIGZvciBzb21lIHBhdGNo
ZXMKPiAtIEFkZGVkIHJldmlldyB0YWdzCj4gLSBSZW1vdmVkIHBhdGNoZXMgdGhhdCBoYXZlIGJl
ZW4gYXBwbGllZAo+IC0gQWRkZWQgcmV2ZXJ0IGZvciB0aGUgZXh5bm9zIHBhdGNoLCBhcHBsaWVk
IGJ5IG1pc3Rha2UKPiAtIFVwZGF0ZSBjb3ZlciB3aXRoIGdyYW5kIHBsYW4gaW5mbyBhbmQgdHJp
bSBzb21lIG9mIGl0Cj4gLSBVcGRhdGVkIGJvdW5jaW5nIGUtbWFpbCBhZGRyZXNzIGluIENjIGxp
c3QKPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTA0MjQt
ZHJtLWJyaWRnZS1jb252ZXJ0LXRvLWFsbG9jLWFwaS12Mi0wLThmOTFhNDA0ZDg2YkBib290bGlu
LmNvbS8KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gSW1wcm92ZWQgY292ZXIgbGV0dGVyIHdpdGgg
bGluayB0byBjb21taXQgYWRkaW5nIGRldm1fZHJtX2JyaWRnZV9hbGxvYygpCj4gLSBhZGQgcmV2
aWV3IHRhZ3MKPiAtIGZpeCBidWdzIGluIHp5bnFtcCwgdmM0IHBhdGNoZXMKPiAtIGZpeCBwYXRj
aCAxIGVycm9yIGNvZGUgY2hlY2tpbmcKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNTA0MDctZHJtLWJyaWRnZS1jb252ZXJ0LXRvLWFsbG9jLWFwaS12MS0wLTQy
MTEzZmY4ZDljMEBib290bGluLmNvbQo+IC0tLQo+IAoKUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5
c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApXaXRoIGJlc3Qg
d2lzaGVzCkRtaXRyeQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
