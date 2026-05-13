Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J4vL/17BGpoKgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 15:26:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8F53407A
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 15:26:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BAC1C8F289;
	Wed, 13 May 2026 13:26:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83B92C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 13:26:19 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64DAVKvv2321247
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 13 May 2026 13:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1A2JIuivfxTHNE33J+4ZfrSn
 HuAPEzqRV86Vt32AWoc=; b=k2+sVBYmVZ6IQNmSNTSEz1M1qd4wswCJFFvnyNxc
 kR7lMnI/qoifc5tBfwJtdRKCTTiGgdsMz53yoebwClcfnY4u2z7KDVV8N0s5w8pM
 W8cKzo6Pyw49XSwLNl/sGtES8RtxR5OCVPg+6l6DrndShstRX+wLtSHhICzhmews
 uiyfDo5q4si49V20xzR96tc/NOXPeH4eyVCo+zdiJIPFh4emrffgdjOMqnK6ZoGV
 oJ9ZRRaP4uFdbrNL+30g4uuGP9zSrK3seLT8SuPK1egfaPDPK2XirOkRWhQ/qoyn
 8L7rD/LIjoc0YeAGlxRJ2/m/+QPHuV5C/YWW/sNOMVpgvg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgua403-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 13:26:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-95f4d5efbe9so4659920241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778678776; x=1779283576;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1A2JIuivfxTHNE33J+4ZfrSnHuAPEzqRV86Vt32AWoc=;
 b=hLlMAPAzqN8fGc5bjUMufXhabOp69u79AD2igvBrrhOcm+o7qAkG/JYo9Zq2ARsQMR
 tXdbMEezGks3GB5gIIykWjrWvYl5dggj+TaixqsVj7rXpoDY5PGu1jGRyhQ1XxYhHcLs
 EjaCfgfQ94PGBEyzdW87P8zOWhqcH4lrhtKG8d67NL9vnCAjghVIQ2HC7jqbkXyCB4+q
 WJwfgbVJTO2Yu3K1wYd2LS9hwgEvG8xEbx/GKvWYfjlKEkSS6RDLMooThb0teQRmM8Bi
 vbxhZgVDuqFgLcpLZ+iCgJrLohjcYuGgZMJzytDQBK4kMFoQCcqYURWQyJ/+u5nauNWt
 VSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778678776; x=1779283576;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1A2JIuivfxTHNE33J+4ZfrSnHuAPEzqRV86Vt32AWoc=;
 b=ZFvCfqPhXUc8RGeORXJeURFnxZyVXy8+gtpCrwQ/k5KN9dW6AWoRe3UjGVhA9AO+NY
 O90dBgX8JBVQRf4gNeHkK9/2H42WgHbRVX0aT/EGIZVmo8+idKE8iullMdcAPr1Cb9f+
 Uz7ANz0tchrpy063/3ohbQp+JgtfkMuiwzeBKMRsZcY3uU0QNjRg5u2ofIezYxb6dy5I
 ZcWzl/GVAe56F24ziWvvUUJfpTg4+we2mHkbi+d96pBEBdJYrfr9rLC15Oe1Jnd+dEPN
 ZEBZWt6p7V1KOwZq6+dlUe0sKPaA30Ek+PLr24uUjGDiVfMJ6YnBfhp5qKso6sw5DUo6
 NVEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9EwND8Xp1VlggVoNv+ZzjBMOAE9h2p5ao2F8EfndmMTZ48DjwqZLqCr0KKH0RzvNRVQeOYG3uAnWOcFg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzXDzKgiikDefBzFn0JYxZfihLh6x6to3pZ8QFbZc4W2P0b/PDw
 f+MGywDEa3UyBRGLAvXQ4pxe/oemGfTjlbTFxHfDdCfRciLcpRi7EZ5acZrButxxaQt/UfwnFS5
 gdktUueY9hHHD6kjBrLvwzKoZJKqmuZSNuBmbLv5Y+BF5i1sPUgpNjedrwJ4fXLlIpmxE5FWMRt
 wIoU8MxXM=
X-Gm-Gg: Acq92OHTVk7j1T/vidBx1uWF/v6iECmWm+3qz4TfgFu4okcAbs/WuyLn0xKknz/Wo29
 9cR7Izke/5r3fWZWpUZdVWcXkQCJdBTjaGv/xthjkG9v5wKBSVfesLeUkcjaYUfM858o/pNwY5K
 q2BibPgunCG3ygzQdJroGHFcqhZHBZiWn4WwUF7O29P+AB64unX2ef0IM3PzPGr5t7qkCecRGcN
 dQAxiWdVqWru/3f5EIMFj+IA1LVRmZdHyoRqss9IimZE4oieZ4GnOrZfn5wz4J1SvOqHGDWvF1b
 puZej63jOxgIhhYZmXp9WFETbshxkgzQDmHjL9uLYKDsqSwYUbcisXiP0Agf7NVj16wQ8x2ucRW
 h0Ol3ZdDbJrAlEZ6sZva0RkI4iIzAVMzwaOZooBQiXxdtF9+HOCrinN6ESeB9WSjMk20oFA8PVz
 lmYj/RzGWeazxKul+rGakaXDfeEsVWQt50QTc=
X-Received: by 2002:a05:6102:c4c:b0:5fe:af0c:79f5 with SMTP id
 ada2fe7eead31-637733e73b9mr1509896137.5.1778678776097; 
 Wed, 13 May 2026 06:26:16 -0700 (PDT)
X-Received: by 2002:a05:6102:c4c:b0:5fe:af0c:79f5 with SMTP id
 ada2fe7eead31-637733e73b9mr1509786137.5.1778678775359; 
 Wed, 13 May 2026 06:26:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-393f60db2f3sm41011661fa.22.2026.05.13.06.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 06:26:13 -0700 (PDT)
Date: Wed, 13 May 2026 16:26:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <ldpcnzvloffhiubmv6zxhfzqo4oz3ntkmav6zjprmbnsrxd46z@t72iga4xvaji>
References: <20260511165942.2774868-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a047bf9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VwfjHJzzgIKQiJfiZN8A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: a5h-lPMDVJpcZLIoPJByDUsCD9H67zFu
X-Proofpoint-ORIG-GUID: a5h-lPMDVJpcZLIoPJByDUsCD9H67zFu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzOCBTYWx0ZWRfX6sCJRUD0RtKg
 gA2cEuVy4K6houpwMMv8MixzSwiw+HKTB1VtufBJTThdnlHPmPfxTJI/QPgtBZvBOP9tldd/Fmu
 2z29mSiEnZVRd4zcy82wQaaP+pQgqkTlDg59FHavIErqc6pNZqWP4roup4+c5LG2pNrT8hzgUSf
 krn2/SyLTOZvWx6cGuNi0YAH+hzO0UQIDlU1h5/uxToTvvjGTYdtawIQ+rR/Zmwf7FOPGcBswbq
 od5uOIzDGs1IHGljuVauBJxDmGlzxJ4Qi86/a4EUUPQV6dBzb9SRk8V4px5bTGDwK2tP2K9rzal
 PWYxYotXywvHi0R5xGZxTLs3p6kJlzgvMwpOv9B8NW+yie8Z/r+MCh2zBTUX+RCV90Ptyi/47kk
 JVHe0+hZaZ04IIGVasJM6Eekx61a72qXDuY5L38ous+jId3MOamQdWRZx7f8NY4lbE5Ct4x2VC3
 4BU6eI6opCe+p82EDeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130138
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-remoteproc@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, imx@lists.linux.dev,
 Tanmay Shah <tanmay.shah@amd.com>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Mohan Reddy Putluru <pmohan@couthit.com>, Suman Anna <s-anna@ti.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Simona Vetter <simona@ffwll.ch>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, David Airlie <airlied@gmail.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Parvathi Pudi <parvathi@couthit.com>, Nas Chung <nas.chung@chipsnmedia.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ben Levinsky <ben.levinsky@amd.com>, Michal Simek <michal.simek@amd.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hussain Khaja <basharath@couthit.com>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-media@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Roger Quadros <rogerq@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 MD Danish Anwar <danishanwar@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, freedreno@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: Consolidate "sram" property
	definition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 57D8F53407A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-remoteproc@vger.kernel.org,m:heiko@sntech.de,m:imx@lists.linux.dev,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:dri-devel@lists.freedesktop.org,m:mirela.rabulea@nxp.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:marijn.suijten@somainline.org,m:pmohan@couthit.com,m:s-anna@ti.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:simona@ffwll.ch,m:detlev.casanova@collabora.com,m:andrew+netdev@lunn.ch,m:airlied@gmail.com,m:jackson.lee@chipsnmedia.com,m:parvathi@couthit.com,m:nas.chung@chipsnmedia.com,m:martin.blumenstingl@googlemail.com,m:ben.levinsky@amd.com,m:michal.simek@amd.com,m:ezequiel@vanguardiasur.com.ar,m:basharath@couthit.com,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:khilman@baylibre.com,m:linux-media@vger.kernel.org,m:linusw@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:tzimmermann@suse.de,m:neil.armstrong@linaro.org,m:victor.liu@nxp.
 com,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-spi@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:abhinav.kumar@linux.dev,m:rogerq@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:kuba@kernel.org,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:robin.clark@oss.qualcomm.com,m:mchehab@kernel.org,m:sean@poorly.run,m:kernel@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:rogerq@ti.com,m:lumag@kernel.org,m:mathieu.poirier@linaro.org,m:lorenzo@kernel.org,m:andersson@kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:danishanwar@ti.com,m:afd@ti.com,m:jesszhan0024@gmail.com,m:vkoul@kernel.org,m:p.zabel@pengutronix.de,m:hugues.fruchet@foss.st.com,m:dmaengine@vger.kernel.org,m:krzk+dt@kernel.org,m:freedreno@lists.freedesktop.org,m:davem@davemloft.net,m:nbd@nbd.name,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.394];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[76];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,sntech.de,lists.linux.dev,amd.com,nxp.com,lists.freedesktop.org,google.com,somainline.org,couthit.com,ti.com,gmail.com,st-md-mailman.stormreply.com,baylibre.com,ffwll.ch,collabora.com,lunn.ch,chipsnmedia.com,googlemail.com,vanguardiasur.com.ar,redhat.com,kernel.org,suse.de,linaro.org,pengutronix.de,linux.intel.com,linux.dev,lists.infradead.org,poorly.run,foss.st.com,davemloft.net,nbd.name];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:59:36AM -0500, Rob Herring (Arm) wrote:
> The "sram" property has become a de facto standard property, so create a
> common schema for it and drop all the duplicated definitions.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  2 +-
>  .../devicetree/bindings/display/msm/gpu.yaml  |  6 +----


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # display/msm


>  .../bindings/dma/stericsson,dma40.yaml        |  8 ++----
>  .../bindings/media/cnm,wave521c.yaml          |  2 +-
>  .../bindings/media/nxp,imx8-jpeg.yaml         |  6 ++---
>  .../bindings/media/rockchip,vdec.yaml         |  5 ++--
>  .../bindings/media/st,stm32-dcmi.yaml         |  6 ++---
>  .../devicetree/bindings/net/mediatek,net.yaml |  3 +--
>  .../bindings/net/ti,icssg-prueth.yaml         |  2 +-
>  .../bindings/net/ti,icssm-prueth.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  7 +----
>  .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  |  8 ------
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  8 ------
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  9 +------
>  .../devicetree/bindings/spi/st,stm32-spi.yaml | 10 +++----
>  .../bindings/sram/sram-consumer.yaml          | 26 +++++++++++++++++++
>  16 files changed, 48 insertions(+), 62 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sram/sram-consumer.yaml
> 

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
