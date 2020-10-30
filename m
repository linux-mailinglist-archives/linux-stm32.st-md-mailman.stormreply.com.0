Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CBB2A2549
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Nov 2020 08:32:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EED5C46D4D;
	Mon,  2 Nov 2020 07:32:24 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4301C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 17:27:32 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09UH4JbG086980; Fri, 30 Oct 2020 13:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kRv/mdN0gxrWM4bjmBGarbvn1q9ZLkvFoS6y5DzvQks=;
 b=UWWtqWmXJl3nSrq5VxzL3fA7gftqPT2l/7zujH5kX5UvHZQ2eMEv18xIFli+pDzv7TND
 NhYhOuFvYct9W6WTKfBbUytZ8/Cf+k1x8aeC7Oe5QD8YYyP+4VpoSpOUMvDWDIAhxnB6
 c5FhsgKRalTM6aUBHcNHDfpT9wtGJzgUJ5nY4j/m0uXK5U6stXBYO3eHSNoVzcotT/Xy
 9WS3NIpRpBYAz5DKkKDBBTsOJC2EE7S2Jsz0m9qB01bvBxEWMhFx70vhSmjAfeVZzs6/
 v05iYc3aUMt+dm/aSv5oejFCOaASxJm22fB+sZfWIK+97WfQXSV6rjYLkmgp0HqWCmHh bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34gm93xm0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 13:26:38 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09UH5286089727;
 Fri, 30 Oct 2020 13:26:37 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34gm93xm01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 13:26:37 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09UHH2Ts031290;
 Fri, 30 Oct 2020 17:26:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 34dwh0jff3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 17:26:35 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09UHQWf831130076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 17:26:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81EE111C05C;
 Fri, 30 Oct 2020 17:26:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60F4211C050;
 Fri, 30 Oct 2020 17:26:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.85.67])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 17:26:30 +0000 (GMT)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <58cf3c2d611e0197fb215652719ebd82ca2658db.1604042072.git.mchehab+huawei@kernel.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <94520e35-6b73-c951-206e-0031d41ebf83@linux.ibm.com>
Date: Fri, 30 Oct 2020 18:26:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <58cf3c2d611e0197fb215652719ebd82ca2658db.1604042072.git.mchehab+huawei@kernel.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-30_07:2020-10-30,
 2020-10-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 clxscore=1011 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300122
X-Mailman-Approved-At: Mon, 02 Nov 2020 07:32:20 +0000
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Petr Mladek <pmladek@suse.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Sebastian Reichel <sre@kernel.org>,
 linux-mm@kvack.org, Bruno Meneguele <bmeneg@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Pavel Machek <pavel@ucw.cz>, Hanjun Guo <guohanjun@huawei.com>,
 Guenter Roeck <groeck@chromium.org>, netdev@vger.kernel.org,
 Oleh Kravchenko <oleg@kaa.org.ua>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 =?UTF-8?Q?Javier_Gonz=c3=a1lez?= <javier@javigon.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Gross <mgross@linux.intel.com>, linux-acpi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Nayna Jain <nayna@linux.ibm.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Orson Zhai <orsonzhai@gmail.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, Len Brown <lenb@kernel.org>,
 Juergen Gross <jgross@suse.com>, linuxppc-dev@lists.ozlabs.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Oded Gabbay <oded.gabbay@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Dan Murphy <dmurphy@ti.com>,
 xen-devel@lists.xenproject.org, Philippe Bergheaud <felix@linux.ibm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Benson Leung <bleung@chromium.org>,
 Konstantin Khlebnikov <koct9i@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Felipe Balbi <balbi@kernel.org>, Kranthi Kuntala <kranthi.kuntala@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Leonid Maksymchuk <leonmaxx@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [Linux-stm32] [PATCH v2 20/39] docs: ABI: testing: make the
 files compatible with ReST output
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

CgpMZSAzMC8xMC8yMDIwIMOgIDA4OjQwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgYSDDqWNyaXTC
oDoKPiBTb21lIGZpbGVzIG92ZXIgdGhlcmUgd29uJ3QgcGFyc2Ugd2VsbCBieSBTcGhpbnguCj4g
Cj4gRml4IHRoZW0uCj4gCj4gQWNrZWQtYnk6IEpvbmF0aGFuIENhbWVyb248Sm9uYXRoYW4uQ2Ft
ZXJvbkBodWF3ZWkuY29tPiAgIyBmb3IgSUlPCj4gU2lnbmVkLW9mZi1ieTogTWF1cm8gQ2FydmFs
aG8gQ2hlaGFiPG1jaGVoYWIraHVhd2VpQGtlcm5lbC5vcmc+Cj4gLS0tCi4uLgo+ICAgRG9jdW1l
bnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1jbGFzcy1jeGwgICAgIHwgIDE1ICstCi4uLgo+ICAg
RG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1jbGFzcy1vY3hsICAgIHwgICAzICsKCgpQ
YXRjaGVzIDIwLCAyOCBhbmQgMzEgbG9vayBnb29kIGZvciBjeGwgYW5kIG9jeGwuCkFja2VkLWJ5
OiBGcmVkZXJpYyBCYXJyYXQgPGZiYXJyYXRAbGludXguaWJtLmNvbT4KCiAgIEZyZWQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
