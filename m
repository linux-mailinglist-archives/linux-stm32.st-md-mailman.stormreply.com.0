Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HOoyML+rS2ojYQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:21:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9984F7112EB
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:21:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=or4nvSXM;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=bsVcj8rv;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6593EC8F29E;
	Mon,  6 Jul 2026 13:21:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36B53C7A836
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 13:21:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxCMl238138
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 6 Jul 2026 13:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=; b=or4nvSXMp6OqVfrb
 eTPyTd+JNIs5/y38nBtVyWwIiW27rsBdQRdvx0sqzDSt1N13hZdTRnfo3Os6Hc8U
 Y/gk63ZssPZx3V1THQq8OpawsmWcXnUX9kWKPu8qJZpYArT2IiRRxuNPXXcrvR0f
 +7tqkw2pHa2e1blkbCqdhFPwUcX1XSZNNqFS0yzqksjTvbvPrVa8ZbtkuA3Mv96R
 kqAOYnJhAaM1A7UYZBsEg0GK4J5pLn/PgeXTlkEpgO1kvSfFfDeYNfoawKv9eEBL
 JGtvkUNAI+9L6k7Fyx+WBSoZt+2d0I3j9JhzEJ6amrd6l5hLWYDqGzNeaT/hNHiG
 XAl5uQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8950e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 13:21:00 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5be0d09f5fbso2899133e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783344059; x=1783948859;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
 b=bsVcj8rvT4uJjAHWbk4X3ZZ43W1o8y4cd2NZXybJIS9iSXB4uSGQNksWzK1pni4PTT
 W7eqKFz795p+OEHY69iD/0l/g8pgNWBAbLE+WxAXAqheObt9ESHEnlETebGZGF2V+ORr
 5b/FgEsC1Mp0bgqscnX8G1NPw1zSP84C+z+URAfBsfVG1G3msAuRuuxLW0KikB2Z6pus
 kDZzW2cEQqLwtpllqZ4ItWwCMEEYsaoI02Hi9PxoIcQU/tYsCKTTDK3MR7gqQmxceQlr
 lMb9uAMkKyxtmfb4NTgZHyfo1M5EEueOd654BKxLUwQlAD025dT06H6I/hvfqToxXGar
 XsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783344059; x=1783948859;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
 b=B+LI9mcFVlz/gnCCnhl5A5jjlJTYTb4o63+VnLTfyLoliW0NzL7LbgLundc02oTq3K
 IWiIyc/FQxuFsCuoXah7eZz8+SnE6fackCUaujiIU5IgWRA4t2arcgOLytLaBO+Gl1bq
 9P5/rdhW4flMDgA8WoRnbNubHy6xl5tg89xD3oOlGFS8ljx6TaOQe1xRzDdVJa10VVUK
 CKRtbxvuIIe/02C2JUtoBCGH8J0Ci6sH1tTaTqodkpiw8LHh1CR3pEMIP3VUHvyTfB/3
 oGfnMHMHDNqF0QalKrOtz0U12KR8prM1L0Lo+jYSJUPmVOmdvklylTcfkqIHPj7ZABzf
 iNSg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rob+J4ZlbdywqOYV63dpEeCSNkAKawwsvCqvAXjC/gR2TCVC6as69JTHb4y9nO9C70D608qg+QwRR/Z7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyxQyggm7C3qnq54040Gtt0EYX+Nwc7e3JjnIQf9Wm4LTNm5OzZ
 I/anZ140lGp9Ek85X1JoxyX9qL/cGjEkjQm35pM2L6fqmmuD3683l9HtWuYC5s4r/9vHLQUFuAU
 PbvlHf0HUCvoHjH6bK3vLn43M2yA+3h3e0vZujwWTwbVdp1dpo+CR28rvMdbekRoteq47xGj0IR
 pu4g4ul30=
X-Gm-Gg: AfdE7cmXFSYSZtVxJboMtHuHozQjHF0lerryEVGaZ59hj/+q6ph0AGWvmpIWnXqK/E8
 yUg0KK33lcmY4yAL0/vdnvHMkm7gOfxUS0g5BxING7LjMZ1l6R6JJ4S1b9yTFreqXGzSnrVWBd5
 hJu2l59xsorzlkOnRF7kGuW+pQlKQ5vmx4B15EcdXuESl/OJFVgW6HN3pYmPD3p9Fql5loj6cUZ
 95/R0hbXwk4ma1oh8UsUwZ2HQuElsb14A2Z9MLYRdZtyqDboWqq+goVUmnNsniJav0OSKcZ6DWa
 Hqkt2r5zHthQgtoQIhbr0PBWOuPP/2FBYgV4YQiIf4nX5QUcSxw04SjtD1TAboP0fboJpVFn5eU
 qDzg9cOyv/Vk2bW8qGmdLciQACXkoitxdkt/mBDec
X-Received: by 2002:a05:6122:e469:b0:5bd:73b5:6d25 with SMTP id
 71dfb90a1353d-5be9074e753mr306816e0c.5.1783344059164; 
 Mon, 06 Jul 2026 06:20:59 -0700 (PDT)
X-Received: by 2002:a05:6122:e469:b0:5bd:73b5:6d25 with SMTP id
 71dfb90a1353d-5be9074e753mr306757e0c.5.1783344058691; 
 Mon, 06 Jul 2026 06:20:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 06:20:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:22 +0200
MIME-Version: 1.0
Message-Id: <20260706-qcom-sa8255p-emac-v12-7-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5134;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlpwRA2B5tVQ/D/s7B0Bufz2lMNZ9fNOyqanrb1FAug=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uitXkpHF5K6Rc5H2juaPjDX+WdM0SlZPmHq
 rC+rjBIaBmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurogAKCRAFnS7L/zaE
 w9V6EACRebpawQe2y7q8VZHMF5Y42eILGxBCttoAm5H65PSgUVQIlUwIiie91TITslGf5GkfU4R
 NZDfOFhlHZP8QhMdbPo0XqoQ24wcBD8Q+U5WU908BLcT4J4OCJtcMxuNOp/rdZQE/E93Sv0Hd8l
 OPhrOU0PTH8fhGTchTD2K4tQFgb7pr90RMRAppVv4SKzEiyAUvj0Ul8/wX3Q0nFimqcHscKdkmt
 rbOE3KqwsPawJQX1R0sunanImePVYIuLYlDCRqsd8Gs7bGG7+o3lyInW8dgSXu+lgON9PVN65wI
 mOnx1/MU0yLT4b+RjKoJIYA33MCGDelkZ4HCnA/tfDnSc4IqkBWxnruSz5ISHLkp6sEt3zLNKsL
 lw/xWNA4LE94yiHdgvHNGYEjFx7nqlb7jdBHJWYoQ/Kov5VL2r/XnAk1rbZgJtwFMEn4DrukCKS
 HBfrU5m7X+z4DZ/OZDXgya7jaUGHXIWkEFzxJrPAfxQgzKmnS6ZCrbAkUJ4mGIBXu9cGHjRtUs4
 Bgpp+/XklqZQJ2Ko1981ir6hFumr8jZempLQegHyOBbH8UsA+zWcehfiLbHbBYjDJ1mKUYeLPle
 N+SxIr4y7GDZ1lBVUVVonzUoni7lV8ckMooMvUb3Sc/6osTOnmj5+PxEbF6JTEiBqBxFBHUJDMe
 xp5lM6RKQ6LdHJw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXxfzmqJzZA2RJ
 TgyoIcTQ/yzHWR3XwdNde3CQNCN2AUC58peH4FvQH+yjsma++ShRq78Ruq5t2vdntpKm3cu/JKa
 9tSTx3W3Nst/lkqqeI2sw+K7+yZT10U=
X-Proofpoint-GUID: TQ5LSYmRDqhMWS9BOgBvGnlxCFzF3v03
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4babbc cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RTgpwGSXUauNkVmvBPUA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: TQ5LSYmRDqhMWS9BOgBvGnlxCFzF3v03
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX7JApc61Eqih2
 mZY018LeNp5WnCLIGGflQ/OZIaCnn5XI5gddhsWUCGvGZmaGZ4uErAa6gUz9oL/uVtb8opMmytp
 POU8WJxcl7tcurcjLNB5AEIJdM4rCL/B2tfFfLgvFCI2e6L1BoGgLY2/fFbpIcVQtX+JuMPshXH
 GTmSMLsSp74P8z0FRMpUYKiUQ+eoSPilVdEraLny8lYuqmq8LilcDs+91oIus4AWnf0euzXhAu7
 iyBqfKmkWYweF7v8nqhfL7nT3DRLoQgZLRzoqTJum9WocUc+6NUAxHLj6PDbcyyY+QsyYXNfzgz
 yPdMZxWgAi5Mh2JkoVHWhuWBJbZIopzAuD15jsJWgF7hhxInPyCGwHadLHuYRhaIjXVgFfrp52x
 cr8FfMK7OxFwyWEfrcsJBngeEKKu4x0TxgV8oWofsgEOGeraBA2JlwDCuHI0vj6w15n4Kn5ezUl
 nYJPgYP3vypU6Qws8Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060136
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v12 7/7] net: stmmac: qcom-ethqos:
 add support for sa8255p
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:
 linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9984F7112EB

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f379570f80680e96f027873cda6a6bca398e22dc..47175670a32631369a2cf8b00388d9359513e090 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -108,6 +108,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -206,6 +207,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -310,6 +313,29 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -749,6 +775,62 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The SerDes lane, its clocks and the MAC AXI/AHB clocks are owned by
+	 * firmware and brought up through the SCMI power domains above. The
+	 * MAC wrapper itself, however is in the kernel's register space: the
+	 * mux that feeds the SerDes recovered RX clock into the MAC's clk_rx_i
+	 * is not configured by firmware. Without it, clk_rx_i never toggles
+	 * and the DMA SW-reset polled in dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Run on every runtime resume, which stmmac performs after the power
+	 * domains are on but before serdes_powerup() and the DMA reset, so the
+	 * wrapper is always configured ahead of the reset.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -836,6 +918,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
